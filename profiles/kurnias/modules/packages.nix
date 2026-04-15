{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.ccnix.userProfile.packages;
in
{
  options.ccnix.userProfile.packages = {
    enableCliTools = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Installs core CLI alternative tools like eza, bat, and zoxide.";
    };

    enableThemingTools = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Installs theming tools like matugen, cava, and sassc.";
    };

    enableSystemUtilities = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Installs base utilities like wl-clipboard, pwvucontrol, etc.";
    };

    enableAudioTools = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Installs audio tools.";
    };
  };

  config = {
    home.packages = lib.mkMerge [
      # Conditional CLI tools
      (lib.mkIf cfg.enableCliTools [
        pkgs.eza
        pkgs.bat
        pkgs.zoxide
        pkgs.fastfetch
        pkgs.tree
        pkgs.btop
      ])

      # Conditional Theming tools
      (lib.mkIf cfg.enableThemingTools [
        pkgs.cava
        pkgs.gnome-themes-extra
        pkgs.gtk-engine-murrine
        pkgs.matugen
        pkgs.sassc
        pkgs.gnome-tweaks
        pkgs.fuzzel
      ])

      # Conditional System Utilities
      (lib.mkIf cfg.enableSystemUtilities [
        pkgs.brightnessctl
        pkgs.cliphist
        pkgs.wl-clipboard
        pkgs.pwvucontrol
        pkgs.alsa-utils
        pkgs.alsa-tools
        pkgs.lsof
      ])

      # Audio Tools
      (lib.mkIf cfg.enableAudioTools [
        pkgs.portaudio
        # pkgs.opus
        pkgs.ffmpeg
        pkgs.espeak-ng
      ])
    ];
  };
}
