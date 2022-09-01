{
  users.fea =
    { pkgs
    , ...
    }: {
      home.packages = [ pkgs.fd ];
    };
}
