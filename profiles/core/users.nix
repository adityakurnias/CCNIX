{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.ccnix.system.users;
in
{
  options.ccnix.system.users.enable = lib.mkEnableOption "CCNIX user setup";
  config = lib.mkIf cfg.enable {
    users.users.kurnias = {
      isNormalUser = true;
      description = "Kurnias";
      extraGroups = [ 
        "networkmanager"
        "wheel"
        "audio"
        "video"
        "render"
        "docker"
        "uinput"
      ];
      shell = pkgs.zsh;
    };
    users.defaultUserShell = pkgs.zsh;
  };
}
