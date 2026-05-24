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
      pkgs.antigravity
      pkgs.jetbrains-toolbox
      pkgs.unityhub

      # Languages
      pkgs.rustup
      pkgs.go
      pkgs.javaPackages.compiler.temurin-bin.jdk-21
      pkgs.mono
      pkgs.dotnet-sdk_8
      pkgs.php84
      pkgs.ruby_4_0

      # Python
      pkgs.python3
      pkgs.python3Packages.pip
      pkgs.python3Packages.setuptools
      pkgs.python3Packages.sounddevice
      
      # DB
      pkgs.sqlite
      pkgs.mariadb

      # LSP / FMT
      pkgs.nixd
      pkgs.nixfmt

      # Tools
      pkgs.gh
      pkgs.ddev
      pkgs.android-tools
      pkgs.uv
      pkgs.ollama

      # JS devtools
      pkgs.nodejs_24
      pkgs.pnpm
      # pkgs.deno
      pkgs.bun
    ];
  };
}
