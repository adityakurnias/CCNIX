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
}
