{ ... }:

{
  imports = [
    ./environment.nix
    ./users.nix
    ./programs.nix
    ./services.nix
    ./hardware.nix
    ./boot.nix
    ./networking.nix
    ./locales.nix
    ./audio.nix
    ./steam
    ./dev

    ../../modules/nixos/desktop.nix
    ../../modules/nixos/docker.nix
  ];

  ccnix.desktop.enable = true;
  ccnix.virtualisation.docker.enable = true;

  ccnix.networking = {
    enable = true;
    hostName = "ccnixos";
  };

  ccnix.hardware.audio.enable = true;

  ccnix.system.boot.enable = true;
  ccnix.system.environment.enable = true;
  ccnix.hardware.core.enable = true;
  ccnix.system.locales.enable = true;
  ccnix.system.programs.enable = true;
  ccnix.system.users.enable = true;
  ccnix.gaming.steam.enable = true;
}
