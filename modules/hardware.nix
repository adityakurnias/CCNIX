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
}
