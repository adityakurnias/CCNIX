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

  nix.settings = {
    max-jobs = "auto";
    cores = 0;
    accept-flake-config = true;
    auto-optimise-store = true;

    experimental-features = [
      "nix-command"
      "flakes"
    ];
    
    substituters = [
      "https://noctalia.cachix.org"
      "https://nix-community.cachix.org"
      "https://niri.cachix.org"
    ];
    trusted-public-keys = [
      "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "niri.cachix.org-1:Wv0OmO7PsuocRKzfDoJ3mulSl7Z6oezYhGhR+3W2964="
    ];
  };

  documentation.nixos.enable = false;
  documentation.man.enable = false;
  documentation.info.enable = false;

  system.stateVersion = "23.11";
}
