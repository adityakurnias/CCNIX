{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.ccnix.userProfile.devTools;
in
{
  options.ccnix.userProfile.devTools = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Installs the global developer toolchain. Enabling this adds significant weight to the environment closure.";
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      # Editors
      pkgs.vscode
      pkgs.neovim
      pkgs.zed-editor
      pkgs.jetbrains.idea
      pkgs.antigravity

      # Languages
      pkgs.rustup
      pkgs.go
      pkgs.javaPackages.compiler.temurin-bin.jdk-21
      pkgs.ruby_4_0

      # DB
      pkgs.sqlite
      pkgs.dbeaver-bin

      # LSP / FMT
      pkgs.nixd
      pkgs.nixfmt

      # Tools
      pkgs.gh
      pkgs.ddev
      pkgs.android-tools
      pkgs.asdf-vm

      # JS devtools
      pkgs.nodejs_24
      pkgs.pnpm
      pkgs.deno
      pkgs.bun
    ];
  };
}
