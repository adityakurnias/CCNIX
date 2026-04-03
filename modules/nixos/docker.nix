{ config, lib, pkgs, ... }:
let
  cfg = config.ccnix.virtualisation.docker;
in {
  options.ccnix.virtualisation.docker = {
    enable = lib.mkEnableOption "Enable Docker and Arion environments";
  };

  config = lib.mkIf cfg.enable {
    virtualisation.docker.enable = true;

    users.users.kurnias.extraGroups = [ "docker" ];

    virtualisation.arion = {
      backend = "docker";
      projects = {
        "db".settings.services."db".service = {
          restart = "unless-stopped";
          environment = { POSTGRES_PASSWORD = "password"; };
        };
      };
    };
  };
}
