{
  users.fea =
    { pkgs
    , ...
    }: {
      home.packages = [ pkgs.discord ];
    };
}
