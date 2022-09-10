{
  description =
    "Fea's NixOS Configuration Flake";

  outputs =
    { self
    , nixpkgs
    , flake-utils
    , home-manager
    , ...
    } @ inputs: {
      lib = import ./lib { inherit (nixpkgs) lib; };
      nixosConfigurations =
        let
          inherit (self.lib) customModule;
          inherit (nixpkgs.lib) nixosSystem;
          inherit (flake-utils.lib) system;
        in
        {
          laptop = nixosSystem {
            system = system.x86_64-linux;
            modules = [
              home-manager.nixosModules.default
              (customModule ./hosts/laptop)
              (customModule ./hosts/shared)
            ];
            specialArgs = { inherit inputs; };
          };
          server = nixosSystem {
            system = system.x86_64-linux;
            modules = [
              home-manager.nixosModules.default
              (customModule ./hosts/server)
              (customModule ./hosts/shared)
            ];
            specialArgs = { inherit inputs; };
          };
        };
    } // flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = nixpkgs.legacyPackages."${system}";
    in
    {
      formatter = pkgs.nixpkgs-fmt;
    });

  inputs =
    {
      nixpkgs = {
        url = "github:NixOS/nixpkgs/nixos-unstable";
      };
      flake-utils = {
        url = "github:numtide/flake-utils";
      };
      home-manager = {
        url = "github:nix-community/home-manager";
        inputs.nixpkgs.follows = "nixpkgs";
        inputs.utils.follows = "flake-utils";
      };
      helix = {
        url = "github:helix-editor/helix";
        inputs.nixpkgs.follows = "nixpkgs";
        inputs.rust-overlay.follows = "rust-overlay";
      };
      # NOTE: This is a (hopefully) temporary fix to make helix's rust-overlay's flake-utils follow mine
      rust-overlay = {
        url = "github:oxalica/rust-overlay";
        inputs.nixpkgs.follows = "nixpkgs";
        inputs.flake-utils.follows = "flake-utils";
      };
    };
}
