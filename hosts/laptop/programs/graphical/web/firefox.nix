{
  users.fea =
    { pkgs
    , ...
    }: {
      programs.firefox = {
        enable = true;
        package = pkgs.firefox-wayland;
      };
    };
}
