{
  system =
    { pkgs
    , config
    , inputs
    , ...
    } : {
      environment.systemPackages = [ inputs.newm.packages.${pkgs.system}.newm ];
    };
}
