{
  config,
  pkgs,
  lib,
  ...
}:

{
  home.packages = with pkgs; [
    php84
    php84Packages.composer

    (writeShellScriptBin "lamp" ''
      service=$1
      action=$2

      case "$service" in
        a)
            sudo systemctl $action httpd
            ;;
        m)
            sudo systemctl $action mysql
            ;;
        *)
            echo "a == apache"
            echo "m == mariadb"
            echo "Usage:"
            echo "  lamp a {start|stop|restart|status}"
            echo "  lamp m {start|stop|restart|status}"
            exit 1
          ;;
      esac
    '')
  ];
}
