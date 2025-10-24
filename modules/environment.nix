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
  ];

  environment.shells = with pkgs; [ zsh ];
}
