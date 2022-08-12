{
  users.fea =
    { pkgs
    , ...
    }: {
      home.packages = [ pkgs.xournalpp ];
    };
}
