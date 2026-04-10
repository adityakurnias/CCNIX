{ config, lib, pkgs, inputs, ... }:

let
  cfg = config.ccnix.userProfile.desktop;
in
{
  imports = [
    inputs.dankMaterialShell.homeModules.dank-material-shell
    inputs.dankMaterialShell.homeModules.niri
    inputs.noctalia.homeModules.default
  ];

  options.ccnix.userProfile.desktop = {
    shell = lib.mkOption {
      type = lib.types.enum [ "dank-material-shell" "noctalia-shell" "none" ];
      default = "none";
      description = "The desktop shell to use (dank-material-shell or noctalia-shell).";
    };
  };

  config = lib.mkMerge [
    # Dank Material Shell
    (lib.mkIf (cfg.shell == "dank-material-shell") {
      programs.dank-material-shell = {
        enable = true;
        niri = {
          includes.enable = false;
        };

        systemd = {
          enable = true;
          restartIfChanged = true;
        };

        dgop.package = inputs.dgop.packages.${pkgs.system}.default;
        quickshell.package = pkgs.quickshell;
      };

      xdg.configFile."niri/shell-binds.kdl".source = ../../../configs/niri/dms/binds.kdl;
    })

    # Noctalia Shell
    (lib.mkIf (cfg.shell == "noctalia-shell") {
      programs.noctalia-shell = {
        enable = true;
        settings = {
          # Sensible defaults/settings according to docs
          bar = {
            position = "top";
            density = "compact";
          };
          general = {
            telemetryEnabled = false;
            animationSpeed = 1;
            allowPanelsOnScreenWithoutBar = true;
          };
          appLauncher = {
            viewMode = "list";
          };
          dock = {
            enabled = true;
            position = "bottom";
          };
        };
      };

      xdg.configFile."niri/shell-binds.kdl".source = ../../../configs/niri/noctalia/binds.kdl;
    })
  ];
}
