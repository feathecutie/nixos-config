{
  users.fea =
    { pkgs
    , ...
    }: {
      home.packages = [ pkgs.heroic ];
    };
}
