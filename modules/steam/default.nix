{ config, lib, pkgs, ... }:

{
  options.steam.enable = lib.mkEnableOption "Enable Steam support";

  config = lib.mkIf config.steam.enable {

    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };

    hardware.steam-hardware.enable = true;
    programs.gamemode.enable = true;

    environment.systemPackages = [
      pkgs.steam-run
    ];
  };
}
