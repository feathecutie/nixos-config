{
  system =
    { pkgs
    , ...
    }: {
      virtualisation.oci-containers.containers.skyrim-together = {
        autoStart = true;
        image = "tiltedphoques/st-reborn-server:latest";
        ports = [ "10578:10578/udp" ];
        volumes = [
          "/home/fea/skyrim-together/config:/home/server/config",
          "/home/fea/skyrim-together/logs:/home/server/logs",
          "/home/fea/skyrim-together/Data:/home/server/Data"
        ];
      };
    };
}
