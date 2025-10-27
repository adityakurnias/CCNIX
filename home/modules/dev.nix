{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Editors
    vscode
    neovim
    zed-editor

    # Languages
    # php => moved to dev/lamp.nix

    # DB
    sqlite
    dbeaver-bin
    # mariadb => moved to dev/lamp.nix
    
    # LSP / FMT
    nixd
    nixfmt-rfc-style

    # Tools
    git
    gh
    ddev
    
    # JS devtools
    nodejs_24
    pnpm
    deno
  ];
}
