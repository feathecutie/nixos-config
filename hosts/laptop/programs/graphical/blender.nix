{
  users.fea =
    { pkgs
    , ...
    }: {
      home.packages = [ pkgs.blender ];
    };
}
