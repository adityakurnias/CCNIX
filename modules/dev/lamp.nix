{ pkgs, ... }:

{
  services = {
    # Apache (HTTPD)
    httpd = {
      enable = true;
      adminAddr = "admin@localhost";
      hostName = "localhost";
      enablePHP = true;
      extraModules = [ "proxy_fcgi" "setenvif" ];
      virtualHosts."localhost" = {
        root = "/home/kurnias/Documents/Projects/www";
        extraConfig = ''
          <Directory "/home/kurnias/Documents/Projects/www">
            AllowOverride All
            Require all granted
          </Directory>

          <FilesMatch \.php$>
            SetHandler "proxy:unix:/run/php-fpm-www.sock|fcgi://localhost/"
          </FilesMatch>
        '';
      };
    };

    # PHP-FPM (untuk Apache)
    php-fpm = {
      enable = true;
      phpPackage = pkgs.php83;
      pools."www" = {
        user = "apache";
        group = "apache";
        listen = "/run/php-fpm-www.sock";
        phpOptions = ''
          display_errors = On
          memory_limit = 512M
        '';
      };
    };

    # MariaDB (MySQL)
    mysql = {
      enable = true;
      package = pkgs.mariadb;
      dataDir = "/var/lib/mysql";
      ensureDatabases = [ "lamp_db" ];
      ensureUsers = [
        {
          name = "root";
          password = "root";
          ensurePermissions = {
            "*.*" = "ALL PRIVILEGES";
          };
        }
      ];
    };

  };

  # PHP & tools
  environment.systemPackages = with pkgs; [
    php84
    php84Packages.composer
    mariadb
    apacheHttpd
  ];

  # Firewall
  networking.firewall.allowedTCPPorts = [ 80 443 ];

  # Web root (aman untuk develop)
  system.activationScripts.webroot = ''
    mkdir -p /home/kurnias/Documents/Projects/www
    chown -R kurnias:users /home/kurnias/Documents/Projects/www
    chmod -R 755 /home/kurnias/Documents/Projects/www
    if [ ! -f /home/kurnias/Documents/Projects/www/index.php ]; then
      echo "<?php phpinfo(); ?>" > /home/kurnias/Documents/Projects/www/index.php
    fi
  '';
}
