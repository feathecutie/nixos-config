# TODO: Maybe make home-manager module work for managing home directories
# and maybe create an easier way to specify persistent files and directories
{
  system =
    { inputs
    , ...
    }: {
      imports = [ inputs.impermanence.nixosModules.impermanence ];
      environment.persistence."/persistent" = {
        users.fea = {
          directories = [
            ".local/share/containers/storage"
          ];
        };
      };
    };
    
  # users.fea =
  #   { inputs
  #   , ...
  #   }: {
  #     imports = [ inputs.impermanence.nixosModules.home-manager.impermanence ];
  #     home.persistence."/persistent/users/fea" = {
  #       directories = [
  #         ".local/share/containers/storage"
  #       ];
  #       allowOther = true;
  #     };
  #   };
}
