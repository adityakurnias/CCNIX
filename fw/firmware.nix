{ pkgs, ...}:

{
  # A way to make my mic working, idk
  hardware.firmware = [
    (pkgs.stdenv.mkDerivation {
      name = "custom-hda-firmware";
      src = ./hda-jack-retask.fw;
      dontUnpack = true;
      installPhase = ''
        mkdir -p $out/lib/firmware
        cp $src $out/lib/firmware/hda-jack-retask.fw
      '';
    })
  ];

  boot.extraModprobeConfig = ''
    options snd-hda-intel patch=hda-jack-retask.fw
  '';
}