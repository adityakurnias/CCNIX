{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.ccnix.system.locales;
in
{
  options.ccnix.system.locales.enable = lib.mkEnableOption "CCNIX standard locales (Jakarta/US)";
  config = lib.mkIf cfg.enable {
    time.timeZone = "Asia/Jakarta";
    i18n.defaultLocale = "en_US.UTF-8";
    services.xserver.xkb.layout = "us";
    services.xserver.xkb.variant = "";
  };
}
