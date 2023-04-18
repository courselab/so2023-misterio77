{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.11";

  outputs = {
    self,
    nixpkgs,
  }: let
    inherit (nixpkgs.lib) genAttrs systems getExe;
    forEachSystem = genAttrs systems.flakeExposed;
    rev = self.shortRev or "dirty";
  in rec {
    # nix build
    packages = forEachSystem (system: let
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      ex1-arm64 = pkgs.callPackage ./ex1/arm64 { inherit rev; };
      ex1-i386 = pkgs.callPackage ./ex1/i386 { inherit rev; };
    });

    formatter = forEachSystem (system: nixpkgs.legacyPackages.${system}.alejandra);
    hydraJobs = {inherit (packages) "x86_64-linux" "aarch64-linux";};
  };

  # Use binaries from my cache
  nixConfig = {
    extra-substituters = ["https://cache.m7.rs"];
    extra-trusted-public-keys = ["cache.m7.rs:kszZ/NSwE/TjhOcPPQ16IuUiuRSisdiIwhKZCxguaWg="];
  };
}
