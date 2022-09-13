# TODO: Split this file up into smaller modules, currently it's just a direct port of the old config
{
  system =
    { pkgs
    , ...
    }: {
      fileSystems = {
        "/" = {
          device = "none";
          fsType = "tmpfs";
          options = [ "defaults" "size=2G" "mode=755" ];
        };
        "/boot" = {
          device = "/dev/disk/by-partlabel/EFI";
          fsType = "vfat";
        };
        "/nix" = {
          device = "/dev/disk/by-partlabel/nixos";
          fsType = "btrfs";
          options = [ "subvol=nix" ];
        };
        "/persistent" = {
          device = "/dev/disk/by-partlabel/nixos";
          fsType = "btrfs";
          options = [ "subvol=persistent" ];
          neededForBoot = true;
        };
      };

      boot = {
        initrd.availableKernelModules = [
          "ehci_pci"
          "ahci"
          "xhci_pci"
          "usb_storage"
          "usbhid"
          "sd_mod"
          "sr_mod"
        ];
        kernelModules = [ "kvm-intel" ];
        loader = {
          systemd-boot = {
            enable = true;
            consoleMode = "max";
            configurationLimit = 20;
          };
          efi.canTouchEfiVariables = true;
        };
      };

      hardware = {
        enableRedistributableFirmware = true;
        cpu.intel.updateMicrocode = true;
      };

      console.keyMap = "de-latin1";

      networking = {
        hostName = "fea-server";
        interfaces.enp0s25.ipv6.addresses = [
          {
            address = "2001:7c7:20f3:d:86e1:aa77:e292:d042";
            prefixLength = 64;
          }
        ];
      };

      time.timeZone = "Europe/Berlin";

      nix.extraOptions = ''
        experimental-features = nix-command flakes
      '';

      nixpkgs.config.allowUnfree = true;

      users = {
        mutableUsers = false;
        users.fea = {
          description = "Fea";
          isNormalUser = true;
          extraGroups = [ "wheel" ];
          hashedPassword = "$6$OxWfNGyataVKhzRS$Klaf9T3UFXg7uQ/Z7hh/1HhJWq.pslvIk3Raa.f7AiKv2jJuK1pZ..tFUkTzH3ZITSn5SoAyBZ23IFQn0I7oR1";
          shell = pkgs.nushell;
        };
        users.root = {
          isSystemUser = true;
          hashedPassword = "$6$OxWfNGyataVKhzRS$Klaf9T3UFXg7uQ/Z7hh/1HhJWq.pslvIk3Raa.f7AiKv2jJuK1pZ..tFUkTzH3ZITSn5SoAyBZ23IFQn0I7oR1";
        };
      };

      environment.systemPackages = (with pkgs; [
        jdk
      ]);

      services.openssh.enable = true;
      programs.mosh.enable = true;
    };
}
