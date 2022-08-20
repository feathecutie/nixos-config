{
  users.fea =
    { pkgs
    , ...
    }: {
      home.packages = [ pkgs.nyxt ];
    };
}
