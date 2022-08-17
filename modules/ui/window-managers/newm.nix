{
  system =
    { pkgs
    , config
    , inputs
    , ...
    } : {
      environment.systemPackages = [ inputs.newm.packages.${pkgs.system}.newm ];
    };
  # users.fea.xdg.configFile."newm/config.py".text = ''
  #   import os
  #   from pywm import (
  #     PYWM_MOD_LOGO,
  #     PYWM_MOD_ALT
  #   )
  #   bar = {
  #     'enabled' = False,
  #   }
  # '';
}
