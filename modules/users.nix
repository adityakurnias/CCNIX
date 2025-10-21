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
    ];
    shell = pkgs.zsh;
  };

  users.defaultUserShell = pkgs.zsh;
}