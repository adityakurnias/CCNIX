{ pkgs, ... }:

{
  services.gnome.gnome-keyring.enable = true;
  services.flatpak.enable = true;
  services.printing.enable = false;
  services.gvfs.enable = true;
}
