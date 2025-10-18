{ pkgs, config, ... }:

{
  programs.niri.enable = true;

  programs.nix-ld.enable = true;

  programs.zsh.enable = true;

  programs.steam = {
    enable = true;
    extraPackages = with pkgs; [ mangohud ];
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };
}