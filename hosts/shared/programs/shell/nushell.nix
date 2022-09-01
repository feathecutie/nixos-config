{
  users.fea =
    { pkgs
    , ...
    }: {
      programs.nushell = {
        enable = true;
        envFile.text = ''
          mkdir ~/.cache/starship
          starship init nu | save ~/.cache/starship/init.nu
        '';
        configFile.text = ''
          source ~/.cache/starship/init.nu
          ${pkgs.ponysay}/bin/ponysay --ponyonly
        '';
      };
    };
}
