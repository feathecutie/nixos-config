{
  system =
    { pkgs
    , ...
    }: {
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
    };
}