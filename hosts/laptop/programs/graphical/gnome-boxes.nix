{
  users.fea =
    { pkgs
    , ...
    }: {
      home.packages = [ pkgs.gnome.gnome-boxes ];
    };
}
