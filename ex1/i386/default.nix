{
  pkgs ? import <nixpkgs> {},
  rev ? "dirty",
}: let
  pkgsi386 = pkgs.pkgsCross.i686-embedded;
in
  pkgsi386.stdenv.mkDerivation {
    pname = "syseg-ex1";
    version = rev;

    src = ./.;
  }
