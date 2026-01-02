{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../fw/firmware.nix
    ../modules
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [
      "ventoy-1.1.07"
    ];
  };
  
  system.stateVersion = "25.05";
}
