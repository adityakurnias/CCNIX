{
  pkgs,
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

  programs.virt-manager.enable = false;

  users.groups.libvirtd.members = [ "kurnias" ];
  
  virtualisation.waydroid.enable = false;

  virtualisation.libvirtd.enable = false;

  virtualisation.spiceUSBRedirection.enable = false;

}
