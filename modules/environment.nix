{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vim
    wget
    curl
    git
    kitty
    
    # Home Manager
    home-manager
    
    # Linux, Flash & Boot
    efibootmgr
    ntfs3g
    woeusb
    ventoy
  ];

  environment.shells = with pkgs; [ zsh ];
}
