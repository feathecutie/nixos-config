{ lib }:
let
  customModule = path:
    let
      imports = lib.mapAttrsToList
        (name: type:
          if type == "regular" then
            let
              imported = import (path + "/${name}");
              systemModule = if imported ? "system" then { imports = [ imported.system ]; } else {};
              userModules = if imported ? "users" then { home-manager.users = imported.users; } else {};
            in
              systemModule // userModules
          else if type == "directory" then
            customModule (path + "/${name}")
          else
            {})
        (builtins.readDir path);
    in
    {
      inherit imports;
    };
in
customModule