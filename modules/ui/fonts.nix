{
  system =
    { pkgs
    , ...
    }: {
      fonts.fonts = [
        (pkgs.nerdfonts.override { fonts = [
          # "CascadiaCode"
          "VictorMono"
        ]; })
      ];
    };

  # users.fea =
  #   { pkgs
  #   , ...
  #   }: {
  #     home.packages = [
  #       (pkgs.nerdfonts.override { fonts = [ "FiraCode" ]; })
  #     ];
      
  #     fonts.fontconfig.enable = true;
  #   };
}
