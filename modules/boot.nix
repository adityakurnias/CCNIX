{ config, pkgs, ... }:

{
  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 5;
  
  boot.kernelModules = [ "snd_hda_intel" ];
  boot.kernelParams = [ "elevator=bfq" ];
  
  boot.kernel.sysctl = {
    "vm.swappiness" = 10;
    "vm.vfs_cache_pressure" = 50;
  };
  
  boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.initrd.checkJournalingFS = false;

}