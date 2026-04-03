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
    home.packages = [ pkgs.osu-lazer-bin ];
  };
}
