{
  system =
    {
      virtualisation.podman.enable = true;
      users.users.fea.extraGroups = [ "podman" ];
    };
}
