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

      # Boot-related stuff
      boot = {
        loader = {
          systemd-boot = {
            enable = true;
            consoleMode = "max";
            configurationLimit = 20;
          };
          efi.canTouchEfiVariables = true;
        };
        initrd.availableKernelModules = [
          # Not sure which of these are necessary
          "nvme"
          "xhci_pci"
          "usbhid"
          "usb_storage"
          "sd_mod"
          "rtsx_pci_sdmmc"
        ];
        kernelModules = [
          # Not sure if this is necessary
          "kvm_amd"
        ];
        kernelPackages = pkgs.linuxPackages_latest;
      };

      # Hardware
      hardware.enableRedistributableFirmware = true;

      # Time
      time = {
        timeZone = "Europe/Berlin";
        hardwareClockInLocalTime = true;
      };

      # i18n
      console.keyMap = "de-latin1";

      # Nix
      nix.extraOptions = ''
        experimental-features = nix-command flakes
      '';

      # nixpkgs
      nixpkgs.config.allowUnfree = true;
    };
}
