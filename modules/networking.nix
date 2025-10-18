{ config, pkgs, ... }:

{
  networking.hostName = "ccnixos";
  networking.networkmanager.enable = true;
}

