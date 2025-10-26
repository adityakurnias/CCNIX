{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vim

    wget
    curl
    arion

    git

    kitty

    home-manager
    wireplumber

    efibootmgr
    
    xorg.libX11
    xorg.libXcursor
    xorg.libXrandr
    xorg.libXi
    freetype
    libglvnd
  ];

  environment.shells = with pkgs; [ zsh ];
}
