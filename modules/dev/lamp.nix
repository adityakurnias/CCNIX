{ 
  config, 
  pkgs,
  lib,
  ... 
}:

{
  services.httpd = {
    enable = true;
    wantedBy = lib.mkForce [ ];
    enablePHP = true;
    phpPackage = pkgs.php84;

    virtualHosts = {
      "site.local" = {
        documentRoot = "/srv/www";
        extraConfig = ''
          <Directory /srv/www>
            Options Indexes FollowSymLinks
            AllowOverride All
            Require all granted
            DirectoryIndex index.php index.html
          </Directory>
        '';
      };
      
      "phpmyadmin.local" = {
        documentRoot = "/srv/www/phpmyadmin";
        extraConfig = ''
          <Directory "/srv/www/phpmyadmin">
            Options Indexes FollowSymLinks
            AllowOverride All
            Require all granted
            DirectoryIndex index.php index.html
          </Directory>
        '';
      };
    };
  };

  services.mysql = {
    enable = true;
    wantedBy = lib.mkForce [ ];
    package = pkgs.mariadb;
  };

  environment.systemPackages = with pkgs; [
    php84
    php84Packages.composer
  ];

  users.users.wwwrun.extraGroups = [ "users" ];

  networking.firewall.allowedTCPPorts = [ 80 443 ];

  networking.extraHosts = ''
    127.0.0.1 site.local
    127.0.0.1 phpmyadmin.local
  '';

  systemd.tmpfiles.rules = [
    "d /srv/www 0755 kurnias users -"
  ];
}
