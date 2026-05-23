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
    services.xserver.enable = true;
    services.xserver.videoDrivers = [ "modesetting" ];

    services.greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --remember --cmd niri-session";
          user = "greeter";
        };
      };
    };

    # Avoid boot log output overlap on TTY
    systemd.services.greetd.serviceConfig = {
      Type = "idle";
    };
  };
}
