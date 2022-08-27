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
      nixosConfigurations =
        let
          inherit (nixpkgs.lib) nixosSystem;
          inherit (flake-utils.lib) system;
          inherit (import ./lib { inherit (nixpkgs) lib; }) customModule;
        in
        {
          laptop = nixosSystem {
            system = system.x86_64-linux;
            modules = [
              home-manager.nixosModules.default
              (customModule ./hosts/laptop)
            ];
            specialArgs = { inherit inputs; };
          };
          server = nixosSystem {
            system = system.x86_64-linux;
            modules = [
                home-manager.nixosModules.default
                (customModule ./hosts/server)
            ];
            specialArgs = { inherit inputs; };
          };
        };
    };

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
      newm = {
        url = "github:jbuchermn/newm";
        inputs.nixpkgs.follows = "nixpkgs";
        inputs.flake-utils.follows = "flake-utils";
      };
      helix = {
        url = "github:helix-editor/helix";
        inputs.nixpkgs.follows = "nixpkgs";
      };
      # zig-overlay = {
      #   url = "github:roarkanize/zig-overlay";
      #   inputs.nixpkgs.follows = "nixpkgs";
      #   inputs.flake-utils.follows = "flake-utils";
      # };
    };
}
