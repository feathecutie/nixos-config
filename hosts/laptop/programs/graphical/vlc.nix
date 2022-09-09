{
  users.fea =
    { pkgs
    , ...
    }: {
      home.packages = [ pkgs.vlc ];
    };
}
