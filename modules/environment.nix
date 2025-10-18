{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vim

    wget
    curl

    git

    kitty

    home-manager
    wireplumber
  ];

  environment.shells = with pkgs; [ zsh ];
}