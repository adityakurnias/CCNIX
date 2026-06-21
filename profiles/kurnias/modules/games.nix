{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.ccnix.userProfile.games;
in
{
  options.ccnix.userProfile.games.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable gaming packages";
  };
  config = lib.mkIf cfg.enable {
    home.packages = [
      # Add games here
      # pkgs.osu-lazer-bin
    ];

    services.sunshine = {
      enable = true;
      autoStart = false;
      capSysAdmin = true; # only needed for Wayland -- omit this when using with Xorg
      openFirewall = true;
    };
  };
}
