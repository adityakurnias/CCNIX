{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.ccnix.system.boot;
in
{
  options.ccnix.system.boot.enable = lib.mkEnableOption "CCNIX core bootloader config";
  config = lib.mkIf cfg.enable {
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    boot.loader.systemd-boot.configurationLimit = 5;
    boot.kernelModules = [ "snd_hda_intel" ];
    boot.kernelParams = [
      "elevator=bfq"
      "libahci.ignore_sss=1"
      "rootdelay=2"
    ];
    boot.kernel.sysctl = {
      "vm.swappiness" = 10;
      "vm.vfs_cache_pressure" = 50;
      
      "net.ipv4.conf.all.arp_ignore" = 1;
      "net.ipv4.conf.all.arp_announce" = 2;
    };
    boot.kernelPackages = pkgs.linuxPackages_zen;
    boot.initrd.checkJournalingFS = false;
    boot.initrd.availableKernelModules = [
      "ahci"
      "xhci_pci"
      "sd_mod"
    ];
  };
}
