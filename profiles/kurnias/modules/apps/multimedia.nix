{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.ccnix.userProfile.apps.multimedia;
in
{
  options.ccnix.userProfile.apps.multimedia.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable multimedia apps";
  };
  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.vlc
      pkgs.gimp
    ];
  };
}
