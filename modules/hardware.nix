{ pkgs, ... }:

{
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
    extraPackages = with pkgs; [
      vulkan-loader
      vulkan-tools
      mesa.drivers
    ];
    extraPackages32 = with pkgs.pkgsi686Linux; [
      vulkan-loader
      mesa.drivers
    ];
  };
}
