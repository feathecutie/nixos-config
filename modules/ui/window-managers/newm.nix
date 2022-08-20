{
  system =
    { pkgs
    , inputs
    , ...
    } : {
      environment.systemPackages = [ inputs.newm.packages.${pkgs.system}.newm ];
    };
  users.fea =
    { pkgs
    , ...
    }: {
      xdg.configFile."newm/config.py".text = ''
        import os
        from pywm import (
            PYWM_MOD_LOGO,
            PYWM_MOD_ALT
        )

        bar = {
            'enabled': False,
        }

        background = {
            'path': "${pkgs.fetchurl { url = "https://image.tmdb.org/t/p/original/bwLgHY98494mGlU2NahE5bqqPuf.jpg"; sha256 = "/a7QMqPwluZRqWyZ7O55iJC2fBvJx1bugPicRw/Z228="; }}",
        }
    
        mod = PYWM_MOD_LOGO
    
        key_bindings = lambda layout: [
            ("M-Return", lambda: os.system("kitty &"))
        ]
      '';
    };
}
