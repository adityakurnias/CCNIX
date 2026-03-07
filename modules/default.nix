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
    ./desktop.nix
    ./audio.nix
    ./steam
    ./dev
  ];
}
