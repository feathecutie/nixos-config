{
  system =
    { pkgs
    , ...
    }: {
      # Enable Gnome
      services.xserver = {
        enable = true;
        layout = "de";
        desktopManager.gnome.enable = true;
        displayManager.gdm.enable = true;
      };
      # Exclude unnecessary packages
      environment.gnome.excludePackages =
        (with pkgs; [
          gnome-photos
          gnome-tour
          gnome-text-editor
        ]) ++
        (with pkgs.gnome; [
          cheese
          gnome-music
          epiphany
          geary
          totem
          gnome-contacts
          gnome-weather
          gnome-clocks
          gnome-maps
          simple-scan
          gnome-calendar
        ]);
      # Systray support & other extensions
      services.udev.packages = [ pkgs.gnome.gnome-settings-daemon ];
      environment.systemPackages = [
        pkgs.gnomeExtensions.appindicator
        pkgs.gnomeExtensions.gsconnect
      ];
    };
}
