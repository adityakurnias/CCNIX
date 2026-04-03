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

  steam.enable = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nix.settings = {
    max-jobs = "auto";
    cores = 0;
  };

  system.stateVersion = "23.11";
}
