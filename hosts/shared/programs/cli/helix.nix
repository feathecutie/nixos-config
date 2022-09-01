{
  users.fea =
    { pkgs
    , inputs
    , ...
    }: {
      programs.helix = {
        enable = true;
        package = inputs.helix.packages.${pkgs.system}.default;
        settings.theme = "autumn";
      };
    };
}
