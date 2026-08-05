{ config, pkgs, ... }:

{
  services.hermes-agent = {
    enable = true;

    addToSystemPackages = true;
    container.hostUsers = [ "kurnias" ];

    environmentFiles = [
      "/home/kurnias/.hermes/.env"
    ];
    configFile = "/home/kurnias/.hermes/config.yaml";
    workingDirectory = "/home/kurnias";
    stateDir = "/home/kurnias/.hermes";
    extraDependencyGroups = [ "messaging" "voice" ];
  };
}
