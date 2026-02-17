{ lib, ... }:
{
  virtualisation.docker.enable = true;
  systemd.services.docker.enable = false;
  systemd.services.docker.wantedBy = lib.mkForce [ ];
}
