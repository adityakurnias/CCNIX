{ pkgs, ... }:

{
  home.packages = with pkgs; [
    kdePackages.qt6ct
    adw-gtk3
    adwaita-qt
    bibata-cursors
  ];
}
