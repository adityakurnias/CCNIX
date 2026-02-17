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
    ruby_4_0

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
    asdf-vm
    
    # JS devtools
    nodejs_24
    pnpm
    deno
    bun
  ];
}
