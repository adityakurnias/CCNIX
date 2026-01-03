final: prev: {
  steam = prev.steam.override {
    extraPkgs = pkgs: with pkgs; [
      libgdiplus
      libpng
      libpulseaudio
      libvorbis
      xorg.libXcursor
      xorg.libXi
      xorg.libXinerama
      xorg.libXScrnSaver
    ];
  };
}
