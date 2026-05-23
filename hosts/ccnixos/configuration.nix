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
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nix.settings = {
    max-jobs = "auto";
    cores = 0;
    accept-flake-config = true;
    substituters = [
      "https://noctalia.cachix.org"
    ];
    trusted-public-keys = [
      "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
    ];
  };

  documentation.nixos.enable = false;
  documentation.man.enable = false;
  documentation.info.enable = false;

  system.stateVersion = "23.11";
}
