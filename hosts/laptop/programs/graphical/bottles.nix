{
  users.fea =
    { pkgs
    , ...
    }: {
      home.packages = (with pkgs; [ (bottles.override { wine = wineWowPackages.staging; }) ]);
    };
}
