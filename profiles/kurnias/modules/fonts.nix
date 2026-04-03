{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.ccnix.userProfile.fonts;
in
{
  options.ccnix.userProfile.fonts.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable fonts configuration";
  };
  config = lib.mkIf cfg.enable {
    fonts.fontconfig.enable = true;
    home.packages = [
      pkgs.noto-fonts
      pkgs.noto-fonts-cjk-sans
      pkgs.noto-fonts-color-emoji
      pkgs.inter
      pkgs.font-awesome
      pkgs.material-symbols
      pkgs.fira-code-symbols
      pkgs.jetbrains-mono
      pkgs.fira-code
      pkgs.nerd-fonts.caskaydia-cove
      pkgs.rubik
    ];
  };
}
