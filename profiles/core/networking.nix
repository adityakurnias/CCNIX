{ config, lib, pkgs, ... }:

let
  cfg = config.ccnix.networking;
in {
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
    
    # mkDefault allows you to easily override this in `configuration.nix` without throwing errors!
    networking.nftables.enable = lib.mkDefault (!cfg.disableFirewall);
    networking.firewall.enable = lib.mkDefault (!cfg.disableFirewall);
  };
}
