{ pkgs, ... }:

{
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    inter
    font-awesome
    material-symbols
    fira-code-symbols
    jetbrains-mono
  ];
}
