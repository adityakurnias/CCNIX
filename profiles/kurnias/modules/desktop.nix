{ config, lib, pkgs, inputs, ... }:

let
  cfg = config.ccnix.userProfile.desktop;
in
{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  options.ccnix.userProfile.desktop = {
    shell = lib.mkOption {
      type = lib.types.enum [ "noctalia-shell" "none" ];
      default = "none";
      description = "The desktop shell to use (dank-material-shell or noctalia-shell).";
    };
  };

  config = lib.mkMerge [
    # Noctalia Shell
    (lib.mkIf (cfg.shell == "noctalia-shell") {
      programs.noctalia-shell = {
        enable = true;
      };
    })
  ];
}
