{
  pkgs ? import <nixpkgs> {},
  rev ? "dirty",
}: let
  pkgsAarch64 = pkgs.pkgsCross.aarch64-embedded;
in
  pkgsAarch64.stdenv.mkDerivation {
    pname = "syseg-ex1";
    version = rev;

    src = ./.;
  }
