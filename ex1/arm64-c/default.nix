{ pkgs ? import <nixpkgs> {} }: let
  pkgsAarch64 = pkgs.pkgsCross.aarch64-embedded;
in
  pkgsAarch64.stdenv.mkDerivation {
    name = "syseg-ex1-arm64-c";

    src = ./.;
  }
