{
  nixpkgs.overlays = [
    (final: prev: {
      khal = prev.khal.overrideAttrs (_: {
        sphinxHook = null;
      });
    })
  ];
}