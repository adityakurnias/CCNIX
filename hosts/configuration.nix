{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../fw/firmware.nix
    # System modules (modularized)
    ../modules/environment.nix
    ../modules/users.nix
    ../modules/programs.nix
    ../modules/services.nix
    ../modules/hardware.nix
    ../modules/boot.nix
    ../modules/networking.nix
    ../modules/locales.nix
    ../modules/desktop.nix
    ../modules/audio.nix
    
  ];
  
  # Docker
  virtualisation.docker = {
    enable = true;
  };

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
