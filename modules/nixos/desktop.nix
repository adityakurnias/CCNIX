{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.ccnix.desktop;
in
{
  options.ccnix.desktop = {
    enable = lib.mkEnableOption "Enable Desktop configuration";
  };

  config = lib.mkIf cfg.enable {
    # services.xserver.enable = true;
    services.xserver.videoDrivers = [ "modesetting" ];

    services.greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --cmd niri-session";
          user = "greeter";
        };
      };
    };

    systemd.services.greetd.serviceConfig = {
      Type = "idle";
      StandardInput = "tty";
      StandardOutput = "tty";
      StandardError = "journal";
      TTYReset = true;
      TTYVHangup = true;
      TTYVTDisallocate = true;
    };

    boot.consoleLogLevel = 0;
    boot.kernelParams = [
      "quiet"
      "systemd.show_status=auto"
      "rd.systemd.show_status=false"
    ];
  };
}