{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Editors
    vscode
    neovim
    zed-editor-fhs
    jetbrains.idea-community
    antigravity
    # eclipses.eclipse-java => use flatpak 

    # Languages
    # php => moved to dev/lamp.nix
    rustup
    go
    # javaPackages.compiler.temurin-bin.jdk-25
    javaPackages.compiler.temurin-bin.jdk-21

    # DBq
    sqlite
    dbeaver-bin
    # mariadb => moved to dev/lamp.nix
    
    # LSP / FMT
    nixd
    nixfmt-rfc-style

    # Tools
    gh
    ddev
    android-tools
    bruno
    
    # JS devtools
    nodejs_24
    pnpm
    deno
    bun
  ];
}
