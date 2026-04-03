{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.ccnix.userProfile.apps.utility;
in
{
  options.ccnix.userProfile.apps.utility.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable utility apps";
  };
  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.localsend
      pkgs.scrcpy
      pkgs.nautilus
      pkgs.mangohud
      pkgs.kdePackages.dolphin
    ];
  };
}
