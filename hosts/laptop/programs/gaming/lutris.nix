{
  users.fea =
    { pkgs
    , ...
    }: {
      home.packages = [ pkgs.lutris ];
    };
}
