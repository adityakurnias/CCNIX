{ config, lib, ... }: {
  virtualisation.docker.enable = true;

  # Add user to docker group
  users.users.kurnias.extraGroups = [ "docker" ];

  virtualisation.arion = {
    backend = "docker";
    projects = {
      "db".settings.services."db".service = {
        image = "";
        restart = "unless-stopped";
        environment = { POSTGRESS_PASSWORD = "password"; };
      };
    };
  };
}
