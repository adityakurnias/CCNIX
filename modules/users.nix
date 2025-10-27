{ pkgs, ... }:

{
  users.users.kurnias = {
    isNormalUser = true;
    description = "Kurnias";
    extraGroups = [
      "networkmanager"
      "wheel"
      "audio"
      "video"
      "docker"
      "libglvnd"
    ];
    shell = pkgs.zsh;
  };

  users.defaultUserShell = pkgs.zsh;
}