{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ../../fw/firmware.nix
    ../../profiles/core

    inputs.dankMaterialShell.nixosModules.greeter
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nix.settings = {
    max-jobs = "auto";
    cores = 0;
    accept-flake-config = true;
  };

  documentation.nixos.enable = false;
  documentation.man.enable = false;
  documentation.info.enable = false;

  system.stateVersion = "23.11";
}
