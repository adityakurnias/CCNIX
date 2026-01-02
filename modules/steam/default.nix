{ config, lib, pkgs, ... }:

{
  options.steam.enable = lib.mkEnableOption "Enable Steam support";

  config = lib.mkIf config.steam.enable {

    # Steam
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };

    hardware.steam-hardware.enable = true;

    programs.gamemode.enable = true;

    nixpkgs.config.packageOverrides = pkgs: {
      steam = pkgs.steam.override {
        extraPkgs = pkgs: with pkgs; [
          libgdiplus
          libpng
          libpulseaudio
          libvorbis
          xorg.libXcursor
          xorg.libXi
          xorg.libXinerama
          xorg.libXScrnSaver
        ];
      };
    };

    environment.systemPackages = [
      pkgs.steam-run
    ];
  };
}
