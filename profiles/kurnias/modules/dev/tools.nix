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

      # Python
      pkgs.python3
      pkgs.python3Packages.pip
      pkgs.python3Packages.setuptools
      pkgs.python3Packages.sounddevice
      
      # pkgs.ruby_4_0

      # DB
      pkgs.sqlite

      # LSP / FMT
      pkgs.nixd
      pkgs.nixfmt

      # Tools
      pkgs.gh
      pkgs.ddev
      pkgs.android-tools
      pkgs.asdf-vm
      pkgs.zeroclaw
      pkgs.uv
      pkgs.lmstudio
      pkgs.ollama

      # JS devtools
      pkgs.nodejs_24
      pkgs.pnpm
      pkgs.deno
      pkgs.bun
    ];
  };
}
