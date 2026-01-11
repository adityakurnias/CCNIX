{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Editors
    vscode
    neovim
    zed-editor
    jetbrains.idea
    antigravity

    # Languages
    rustup
    go
    # javaPackages.compiler.temurin-bin.jdk-25
    javaPackages.compiler.temurin-bin.jdk-21

    # DBq
    sqlite
    dbeaver-bin
    
    # LSP / FMT
    nixd
    nixfmt

    # Tools
    gh
    ddev
    android-tools
    arion
    
    # JS devtools
    nodejs_24
    pnpm
    deno
    bun
  ];
}
