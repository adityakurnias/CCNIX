{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vim

    wget
    curl

    git

    kitty

    home-manager
  ];

  environment.shells = with pkgs; [ zsh ];
}