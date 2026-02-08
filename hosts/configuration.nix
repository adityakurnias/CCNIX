{ config, pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../fw/firmware.nix
    ../modules
    
    inputs.dankMaterialShell.nixosModules.greeter
  ];
  
  steam.enable = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  
  system.stateVersion = "25.05";
}
