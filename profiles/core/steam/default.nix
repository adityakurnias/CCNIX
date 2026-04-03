{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.ccnix.gaming.steam;
in
{
  options.ccnix.gaming.steam.enable = lib.mkEnableOption "Enable Steam support";
  config = lib.mkIf cfg.enable {
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };
    hardware.steam-hardware.enable = true;
    programs.gamemode.enable = true;
    environment.systemPackages = [ pkgs.steam-run ];
  };
}
