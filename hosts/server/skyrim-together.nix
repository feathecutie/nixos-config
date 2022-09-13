{
  system =
    { pkgs
    , ...
    }: 
    let
      ip = "[2001:7c7:20f3:d:86e1:aa77:e292:d042]";
      port = 10578;
    in
    {
      networking.firewall.allowedUDPPorts = [ port ];
      # Currently, starting the Skyrim Together container via oci-containers does not work
      # because attempted incoming connections just don't get registered at all.
      # This seems to be related to the fact that podman is run by root using this setup,
      # since the normal podman command being executed as root (using sudo) also results in the same issue.
      # This issue seems to be related: https://github.com/containers/podman/issues/6139
      # However, the suggested fix (loading the br_netfilter module) doesn't have any effect.
      # For now, I'll just have to start the server using this command:
      # podman run -p "[2001:7c7:20f3:d:86e1:aa77:e292:d042]:10578:10578/udp" tiltedphoques/st-reborn-server:latest
      # (obviously plus the volume options if I want to mount e.g. the config directory)
      virtualisation.oci-containers.containers.skyrim-together = {
        autoStart = false;
        image = "tiltedphoques/st-reborn-server:latest";
        ports = [
          "${ip}:${toString port}:${toString port}/udp"
        ];
        # volumes = [
        #   "/home/fea/skyrim-together/config:/home/server/config"
        #   "/home/fea/skyrim-together/logs:/home/server/logs"
        #   "/home/fea/skyrim-together/Data:/home/server/Data"
        # ];
      };
    };
}
