{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.ccnix.system.programs;
in
{
  options.ccnix.system.programs.enable =
    lib.mkEnableOption "CCNIX standard system programs and virtualisation";
  config = lib.mkIf cfg.enable {
    programs.nh = {
      enable = true;
      flake = "/home/kurnias/CCNIX";
    };
    programs.niri.enable = true;
    programs.xwayland.enable = true;
    programs.zsh.enable = true;
    users.groups.libvirtd.members = [ "kurnias" ];
    virtualisation.spiceUSBRedirection.enable = false;
    programs.dconf.enable = true;
    programs.nix-ld.enable = true;
    programs.nix-ld.libraries = with pkgs; [
      libX11
      libXi
      libxkbcommon
      libxcb
      libXext
      libXfixes
      libXrender
      libXrandr
      libXtst
      libXScrnSaver

      at-spi2-core
      dbus
      glib

      portaudio
    ];

    programs.direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };
  };
}
