{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.ccnix.userProfile.apps.productivity;
in
{
  options.ccnix.userProfile.apps.productivity.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable productivity apps";
  };
  config = lib.mkIf cfg.enable {
    home.packages = [ pkgs.libreoffice-fresh ];
  };
}
