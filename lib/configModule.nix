{ lib }:
let
  importedSets = map
    (dir: import (../. + "/modules" + "/${dir}"))
    (builtins.attrNames (builtins.readDir (../. + "/modules")));
  systemModules = lib.catAttrs "system" importedSets;
  userModules = lib.mapAttrs
    (_: value: { imports = value; })
    (lib.zipAttrs (lib.catAttrs "users" importedSets));
in
{
  imports = systemModules;
  home-manager.users = userModules;
}
