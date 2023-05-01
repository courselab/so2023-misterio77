{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.11";

  outputs = {
    self,
    nixpkgs,
  }: let
    inherit (nixpkgs.lib) genAttrs systems;
    forEachSystem = genAttrs systems.flakeExposed;
    forEachPkgs = f: forEachSystem (sys: f nixpkgs.legacyPackages.${sys});
  in rec {
    # nix build
    packages = forEachPkgs (pkgs: {
      i386-hex = pkgs.callPackage ./ex1/i386-hex { };
      i386-assembly = pkgs.callPackage ./ex1/i386-assembly { };
      arm64-c = pkgs.callPackage ./ex1/arm64-c { };
    });

    formatter = forEachPkgs (pkgs: pkgs.alejandra);
    hydraJobs = {inherit (packages) x86_64-linux aarch64-linux;};
  };

  # Use binaries from my cache
  nixConfig = {
    extra-substituters = ["https://cache.m7.rs"];
    extra-trusted-public-keys = ["cache.m7.rs:kszZ/NSwE/TjhOcPPQ16IuUiuRSisdiIwhKZCxguaWg="];
  };
}
