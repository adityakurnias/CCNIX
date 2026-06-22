{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.ccnix.networking;
in
{
  options.ccnix.networking = {
    enable = lib.mkEnableOption "CCNIX standard networking configuration";

    hostName = lib.mkOption {
      type = lib.types.str;
      default = "ccnixos";
      description = "The hostname for the primary machine.";
    };

    disableFirewall = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "DANGEROUS: Forces the firewall down. Only for local trusted environments.";
    };
  };

  config = lib.mkIf cfg.enable {
    networking.hostName = cfg.hostName;
    networking.networkmanager.enable = true;

    networking.nftables.enable = lib.mkDefault (!cfg.disableFirewall);
    networking.firewall.enable = lib.mkDefault (!cfg.disableFirewall);

    networking.defaultGateway = "192.168.1.1";

    networking.nameservers = [
      "8.8.8.8"
      "1.1.1.1"
    ];

    networking.firewall.allowedTCPPorts = [
      80 # HTTP
      443 # HTTPS
      5678 # n8n
    ];

    services.avahi = {
      enable = true;
      publish = {
        enable = true;
        userServices = true;
      };
    };

    environment.systemPackages = [
      pkgs.linux-wifi-hotspot
      pkgs.hostapd
      pkgs.iproute2
      pkgs.iw
      pkgs.procps
      pkgs.util-linux
    ];
  };
}
