{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../fw/firmware.nix
    ../modules
  ];
  
  steam.enable = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  
  system.stateVersion = "25.05";
}
