{ pkgs, config, ... }:

{
  imports = [
    ./internet.nix
    ./utility.nix
    ./multimedia.nix
    ./productivity.nix
  ];
}
