{ config, pkgs, ... }:

{
  networking.hostName = "ccnixos";
  networking.networkmanager.enable = true;
  networking.nftables.enable = false;
  networking.firewall.enable = false;
  systemd.services.NetworkManager-dispatcher.enable = false;
}

