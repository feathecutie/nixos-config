# TODO: Maybe make home-manager module work for managing home directories
# and create an easier way to specify persistent files and directories
{
  system =
    { inputs
    , ...
    }: {
      imports = [ inputs.impermanence.nixosModules.impermanence ];
      environment.persistence."/persistent" = {
        hideMounts = true;

        directories = [];
        files = [
          "/etc/machine-id"
          "/etc/ssh/ssh_host_ed25519_key"
          "/etc/ssh/ssh_host_ed25519_key.pub"
          "/etc/ssh/ssh_host_rsa_key"
          "/etc/ssh/ssh_host_rsa_key.pub"
        ];

        users.fea = {
          directories = [
            ".local/share/containers/storage"
          ];
          files = [
            ".config/nushell/history.txt"
          ];
        };
      };
    };
}
