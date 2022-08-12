{
  users.fea =
    { pkgs
    , config
    , ...
    }: {
      home.packages = [ pkgs.lutris ];
    };
}
