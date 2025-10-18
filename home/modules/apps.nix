{ pkgs, config, ... }:

{
  imports = [
    ./apps/internet.nix
    ./apps/utility.nix
    ./apps/multimedia.nix
    ./apps/productivity.nix
  ];
}
