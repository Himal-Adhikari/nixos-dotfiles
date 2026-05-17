{ ... }:
{
  imports = [
    ./hyprland/hyprland.nix
  ];

  home.sessionVariables = {
    "XCURSOR_SIZE" = "24";

    "LIBVA_DRIVER_NAME"="nvidia";
    "__GLX_VENDOR_LIBRARY_NAME"="nvidia";
    "ELECTRON_OZONE_PLATFORM_HINT"="auto";
  };
}
