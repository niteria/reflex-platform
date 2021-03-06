{ haskellPackages, platform }:

with haskellPackages;

[
  ##############################################################################
  # Add general packages here                                                  #
  ##############################################################################
  reflex
  reflex-dom
  reflex-todomvc

] ++ (if platform == "ghcjs" then [
  ##############################################################################
  # Add ghcjs-only packages here                                               #
  ##############################################################################

] else []) ++ (if platform == "ghc" then [
  ##############################################################################
  # Add ghc-only packages here                                                 #
  ##############################################################################

] else []) ++ builtins.concatLists (map (x: x.override { mkDerivation = drv: (drv.buildDepends or []) ++ (drv.libraryHaskellDepends or []) ++ (drv.executableHaskellDepends or []); }) [ reflex reflex-dom reflex-todomvc ])
