{ config, lib, pkgs, ... }:

let
  cfg = config.ccnix.hardware.audio;
in {
  options.ccnix.hardware.audio = {
    enable = lib.mkEnableOption "CCNIX standard audio configuration via PipeWire";
  };

  config = lib.mkIf cfg.enable {
    services.pulseaudio.enable = lib.mkDefault false;
    security.rtkit.enable = lib.mkDefault true;
    
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true; 
    };
    
    environment.systemPackages = [
      pkgs.wireplumber
    ];
  };
}