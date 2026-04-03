{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.ccnix.system.environment;
in
{
  options.ccnix.system.environment.enable = lib.mkEnableOption "CCNIX core environment tools";
  config = lib.mkIf cfg.enable {
    environment.systemPackages = [
      pkgs.vim
      pkgs.wget
      pkgs.curl
      pkgs.git
      pkgs.kitty
      pkgs.home-manager
      pkgs.efibootmgr
      pkgs.ntfs3g
      pkgs.woeusb
      pkgs.ventoy
      pkgs.nh
    ];
    environment.shells = [ pkgs.zsh ];
  };
}
