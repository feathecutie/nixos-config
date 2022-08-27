{
  users.fea =
    { pkgs
    , ...
    }: {
      home.packages = [ pkgs.signal-desktop ];
    };
}
