{ config, pkgs, ... }:
{
  environment.systemPackages = [
    (pkgs.discord.override {
      commandLineArgs = [
        "--enable-features=UseOzonePlatform,WebRTCPipeWireCapturer"
        "--ozone-platform=wayland"
        "--use-pipewire-capture"
      ];
    })
  ];
}
