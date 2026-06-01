{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.ccnix.hardware.core;
in
{
  options.ccnix.hardware.core.enable =
    lib.mkEnableOption "CCNIX core hardware optimizations (zram, fstrim, powersave)";
  config = lib.mkIf cfg.enable {
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        intel-media-driver
        intel-vaapi-driver
        libvdpau-va-gl
      ];
      extraPackages32 = with pkgs.pkgsi686Linux; [
        intel-media-driver
        intel-vaapi-driver
        libvdpau-va-gl
      ];
    };
    environment.sessionVariables = {
      LIBVA_DRIVER_NAME = "iHD";
    };
    zramSwap = {
      enable = true;
      algorithm = "zstd";
      memoryPercent = 50;
    };
    powerManagement.cpuFreqGovernor = "performance";
    services.journald.extraConfig = "SystemMaxUse=200M\nRuntimeMaxUse=100M\nMaxFileSec=1week\n";
    services.journald.storage = "auto";
    fileSystems."/".options = [
      "noatime"
      "nodiratime"
    ];
    systemd.services.NetworkManager-wait-online.enable = false;
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = false;
    };
    services.fstrim.enable = true;
  };
}
