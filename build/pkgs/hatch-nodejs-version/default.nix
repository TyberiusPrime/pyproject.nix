{
  stdenv,
  python3Packages,
  pyprojectHook,
  resolveBuildSystem,
}:
stdenv.mkDerivation (finalAttrs: {
  inherit (python3Packages.hatch-nodejs-version)
    pname
    version
    src
    meta
    ;

  passthru.dependencies = {
    hatchling = [ ];
  };

  nativeBuildInputs = [
    pyprojectHook
  ] ++ resolveBuildSystem finalAttrs.passthru.dependencies;
})
