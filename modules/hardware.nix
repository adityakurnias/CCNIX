{ pkgs, ... }:

{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    # extraPackages = with pkgs; [
    #   intel-media-driver
    #   intel-vaapi-driver
    #   libvdpau-va-gl
    #   mesa
    #   vulkan-loader
    #   vulkan-tools
    # ];
    # extraPackages32 = with pkgs.pkgsi686Linux; [
    #   intel-media-driver
    #   intel-vaapi-driver
    #   libvdpau-va-gl
    #   mesa
    #   vulkan-loader
    # ];
  };
  
  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 50;
  };
  services.xserver.videoDrivers = [ "modesetting" ];
  powerManagement.cpuFreqGovernor = "performance";
  services.earlyoom.enable = true;
  nix.settings.auto-optimise-store = true;
  
  services.journald.extraConfig = ''
    SystemMaxUse=200M
    RuntimeMaxUse=100M
    MaxFileSec=1week
  '';
  services.journald.storage = "volatile";
  fileSystems."/".options = [ "noatime" "nodiratime" ];
  systemd.services.NetworkManager-wait-online.enable = false;
  services.fstrim.enable = true; 
}
