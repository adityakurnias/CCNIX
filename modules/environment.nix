{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vim

    wget
    curl
    
    # Docker Compose Tools?
    arion

    git

    kitty

    # Home Manager
    home-manager
    # Linux, Flash & Boot
    efibootmgr
    ntfs3g
    woeusb
    ventoy
    
    # Pelengkap Virt-Manager
    xorg.libX11
    xorg.libXcursor
    xorg.libXrandr
    xorg.libXi
    freetype
    libglvnd
  ];

  environment.shells = with pkgs; [ zsh ];
}
