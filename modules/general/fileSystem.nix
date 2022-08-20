{
  system =
    { pkgs
    , ...
    }: {
      # File systems
      fileSystems = {
        "/boot" = {
          device = "/dev/disk/by-partlabel/EFI\\x20system\\x20partition";
          fsType = "vfat";
        };
        "/nix" = {
          device = "/dev/disk/by-partlabel/nixos";
          fsType = "btrfs";
          options = [ "subvol=nix" ];
        };
        "/" = {
          device = "/dev/disk/by-partlabel/nixos";
          fsType = "btrfs";
          options = [ "subvol=root" ];
        };
      };
      boot.supportedFilesystems = [ "ntfs" ];
    };
}
