{ pkgs, ... }:

{
  services.gnome.gnome-keyring.enable = true;

  services.mysql = {
    enable = true;
    package = pkgs.mariadb;
};
}
