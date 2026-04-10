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

      home.activation.swapShellBindsDMS = lib.hm.dag.entryAfter ["writeBoundary"] ''
        if [ ! -f $HOME/CCNIX/configs/niri/.current-shell ] || [ "$(cat $HOME/CCNIX/configs/niri/.current-shell)" != "dank-material-shell" ]; then
          cp -f $HOME/CCNIX/configs/niri/dms/binds.kdl $HOME/CCNIX/configs/niri/shell-binds.kdl
          cp -f $HOME/CCNIX/configs/niri/dms/startup.kdl $HOME/CCNIX/configs/niri/shell-startup.kdl
          chmod 644 $HOME/CCNIX/configs/niri/shell-binds.kdl $HOME/CCNIX/configs/niri/shell-startup.kdl
          echo "dank-material-shell" > $HOME/CCNIX/configs/niri/.current-shell
        fi
      '';
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

      home.activation.swapShellBindsNoctalia = lib.hm.dag.entryAfter ["writeBoundary"] ''
        if [ ! -f $HOME/CCNIX/configs/niri/.current-shell ] || [ "$(cat $HOME/CCNIX/configs/niri/.current-shell)" != "noctalia-shell" ]; then
          cp -f $HOME/CCNIX/configs/niri/noctalia/binds.kdl $HOME/CCNIX/configs/niri/shell-binds.kdl
          cp -f $HOME/CCNIX/configs/niri/noctalia/startup.kdl $HOME/CCNIX/configs/niri/shell-startup.kdl
          chmod 644 $HOME/CCNIX/configs/niri/shell-binds.kdl $HOME/CCNIX/configs/niri/shell-startup.kdl
          echo "noctalia-shell" > $HOME/CCNIX/configs/niri/.current-shell
        fi
      '';
    })
  ];
}
