{ config, pkgs, ... }:

{
  # Apache HTTP Server
  services.httpd = {
    enable = true;
    
    # Enable PHP
    enablePHP = true;
    phpPackage = pkgs.php84;
    
    # Virtual host
    virtualHosts.site = {
      documentRoot = "/home/kurnias/Documents/Projects/www";
      extraConfig = ''
        <Directory "/home/kurnias/Documents/Projects/www">
          Options Indexes FollowSymLinks
          AllowOverride All
          Require all granted
        </Directory>
      '';
    };
  };

  # MySQL/MariaDB
  services.mysql = {
    enable = true;
    package = pkgs.mariadb;
  };

  # PHP Extensions (opsional)
  environment.systemPackages = with pkgs; [
    php84
    php84Packages.composer
  ];

  # Firewall - buka port 80 dan 443
  networking.firewall = {
    allowedTCPPorts = [ 80 443 ];
  };
  
  # Menambah hostname ke /etc/hosts
  networking.extraHosts = ''
    127.0.0.1 site
  '';

  # Buat direktori web root
  systemd.tmpfiles.rules = [
    "d /home/kurnias/Documents/Projects/www 0755 kurnias users -"
  ];
}