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
  ];

  environment.shells = with pkgs; [ zsh ];
}