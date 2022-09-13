{
  users.fea =
    { pkgs
    , config
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
            show_banner: false
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
          ${pkgs.lib.optionalString (builtins.elem pkgs.zellij config.home.packages) ''
            # Only print ponies if not in a zellij session, as that would get too cluttered
            if (not (zellij list-sessions | lines | any { |session| $session =~ "(current)" })) {
              ${pkgs.ponysay}/bin/ponysay --ponyonly
            }
          '' }
        '';
      };
    };
}
