{ config, pkgs, ... }:

{
  services.hermes-agent = {
    enable = true;

    addToSystemPackages = true;
    container.hostUsers = [ "kurnias" ];

    environmentFiles = [
      "/home/kurnias/.hermes/.env"
    ];
  };
}
