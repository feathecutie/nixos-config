{
  users.fea =
    { pkgs
    , ...
    }: {
      home.packages = [ pkgs.zellij ];
    };
}
