{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.ccnix.userProfile.apps.internet;
in
{
  options.ccnix.userProfile.apps.internet.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable internet apps";
  };
  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.vesktop
      pkgs.discord
      pkgs.google-chrome
      pkgs.firefox
    ];
    programs.zen-browser.enable = true;
  };
}
