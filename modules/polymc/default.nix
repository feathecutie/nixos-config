{
  users.fea =
    { pkgs
    , ...
    }: {
      home.packages = [ pkgs.polymc ];
    };
}
