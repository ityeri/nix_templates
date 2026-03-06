# line 57 of minimum.nix file
lib.composeManyExtensions [
  pyproject-build-systems.overlays.wheel
  overlay

  # Add this part!
  (final: prev: {
    libname = prev.libname.overrideAttrs (old: {
      nativeBuildInputs = (old.nativeBuildInputs or [ ])
        ++ final.resolveBuildSystem { setuptools = [ ]; wheel = [ ]; }; # etc build inputs...
    });

    liba = prev.liba.overrideAttrs (old: {
      nativeBuildInputs = (old.nativeBuildInputs or [ ])
        ++ final.resolveBuildSystem { setuptools = [ ]; wheel = [ ]; }; # etc build inputs...
    });

    libb = prev.libb.overrideAttrs (old: {
      nativeBuildInputs = (old.nativeBuildInputs or [ ])
        ++ final.resolveBuildSystem { setuptools = [ ]; wheel = [ ]; }; # etc build inputs...
    });
  })
]
