{
  users.fea =
    { pkgs
    , ...
    }: {
      home.packages = [ pkgs.krita ];
    };
}
