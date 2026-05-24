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
    fonts = {
      fontconfig.enable = true;
      
      packages = with pkgs; [
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-cjk-serif
        noto-fonts-color-emoji
        inter
        font-awesome
        material-symbols
        fira-code-symbols
        jetbrains-mono
        fira-code
        nerd-fonts.caskaydia-cove
        rubik
      ];
    };
  };
}