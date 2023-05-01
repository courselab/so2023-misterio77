{ pkgs ? import <nixpkgs> {} }: let
  pkgsi386 = pkgs.pkgsCross.i686-embedded;
in
  pkgsi386.stdenv.mkDerivation {
    name = "syseg-ex1-i386-assembly";
    src = ./.;
  }
