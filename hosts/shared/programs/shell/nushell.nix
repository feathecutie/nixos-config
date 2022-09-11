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
          let-env config = {
            hooks: {
              pre_prompt: [{
                code: "
                  let direnv = (direnv export json | from json)
                  let direnv = if ($direnv | length) == 1 { $direnv } else { {} }
                  $direnv | load-env
                "
              }]
            }
          }
          alias create-flake-envrc = ("use flake" | save .envrc; direnv allow)
          ${pkgs.ponysay}/bin/ponysay --ponyonly
        '';
      };
    };
}
