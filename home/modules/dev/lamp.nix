{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Tambahkan lamp switch script
    (writeShellScriptBin "lamp" ''
      case "$1" in
        start)
          echo "🚀 Starting Apache & MariaDB..."
          sudo systemctl start httpd mysql
          ;;
        stop)
          echo "🛑 Stopping Apache & MariaDB..."
          sudo systemctl stop httpd mysql
          ;;
        restart)
          echo "🔁 Restarting Apache & MariaDB..."
          sudo systemctl restart httpd mysql
          ;;
        status)
          echo "📊 Service status:"
          systemctl status httpd mysql --no-pager
          ;;
        *)
          echo "Usage: lamp {start|stop|restart|status}"
          ;;
      esac
    '')
  ];
}
