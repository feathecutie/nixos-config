{
  users.fea =
    { pkgs
    , ...
    }: {
      programs.kitty = {
        enable = true;
        font = {
          name = "VictorMono Nerd Font";
          package = pkgs.nerdfonts.override { fonts = [ "VictorMono" ]; };
          size = 12;
        };
        settings = {
          background_opacity = "0.8";
        };
      };
    };
}
