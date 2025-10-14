{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Editors
    vscode
    neovim
    zed-editor

    # Languages
    php

    # LSP / FMT
    nixd
    nixfmt-rfc-style

    # Tools
    git
    gh
    nodejs_24
    pnpm
    deno
    php84Packages.composer
  ];
}
