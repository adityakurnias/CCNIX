{
  pkgs,
  config,
  lib,
  ...
}:

{
  programs.niri.enable = true;

  programs.nix-ld.enable = true;

  programs.zsh.enable = true;

  programs.steam = {
    enable = true;
    extraPackages = with pkgs; [ mangohud ];
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  programs.virt-manager.enable = true;

  users.groups.libvirtd.members = [ "kurnias" ];

  virtualisation.libvirtd.enable = true;

  virtualisation.spiceUSBRedirection.enable = true;

}
