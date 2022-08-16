{
  users.fea =
    { pkgs
    , ...
    }: {
      home.packages = [ pkgs.btop ];
    };
}
