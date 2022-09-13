{
  system =
    { inputs
    , ...
    }: {
      imports = [ inputs.home-manager.nixosModules.default ];

      home-manager = {
        useUserPackages = true;
        useGlobalPkgs = true;
        extraSpecialArgs = { inherit inputs; };
      };
    };
}
