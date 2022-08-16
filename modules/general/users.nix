{
  system =
    { pkgs
    , ...
    }:
    {
      users = {
        mutableUsers = false;
        users = {
          fea = {
            description = "Fea";
            isNormalUser = true;
            hashedPassword = "$5$VAkJG7ZUpYaZ8WiC$1B2ejTVLA8o3pSQbyb06/PoP3uuJATnGIxDEhWPjki9";
            extraGroups = [ "wheel" ];
            shell = pkgs.nushell;
          };
          root = {
            hashedPassword = "$5$VAkJG7ZUpYaZ8WiC$1B2ejTVLA8o3pSQbyb06/PoP3uuJATnGIxDEhWPjki9";
          };
        };
      };
    };
}
