{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    (writeShellScriptBin "lamp" ''
      service=$1
      action=$2

      case "$service" in
        apache)
          sudo systemctl $action httpd
          ;;
        mariadb)
          sudo systemctl $action mysql
          ;;
        *)
          echo "Usage:"
          echo "  lamp apache {start|stop|restart|status}"
          echo "  lamp mariadb {start|stop|restart|status}"
          exit 1
          ;;
      esac
    '')
  ];
}
