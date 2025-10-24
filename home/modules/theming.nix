{ pkgs, ... }:
let
  tetoCursor = builtins.path {
    path = ../themes/TetoCursor;
    name = "TetoCursor";
    recursive = true;
  };
in
{
  home.packages = with pkgs; [
    qt6ct
    bibata-cursors
  ];

  home.pointerCursor = {
    name = "TetoCursor";
    package = pkgs.buildEnv {
      name = "teto-cursor-theme";
      paths = [
        (pkgs.runCommand "teto-cursor-theme" { } ''
          mkdir -p $out/share/icons
          cp -r ${tetoCursor} $out/share/icons/TetoCursor
        '')
      ];
    };
    size = 24;
  };

  gtk.cursorTheme.name = "TetoCursor";
  gtk.cursorTheme.size = 24;
  xsession.pointerCursor = {
    name = "TetoCursor";
    size = 24;
  };

  home.sessionVariables = {
    QT_QPA_PLATFORMTHEME = "qt6ct";
  };
}
