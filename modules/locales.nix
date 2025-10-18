{ config, pkgs, ... }:

{
  time.timeZone = "Asia/Jakarta";
  i18n.defaultLocale = "en_US.UTF-8";
  services.xserver.xkb.layout = "us";
  services.xserver.xkb.variant = "";
}

