{
  users.fea =
    { pkgs
    , ...
    }: {
      home.packages = [ pkgs.libreoffice-fresh ];
    };
}
