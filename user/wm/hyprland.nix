{pkgs, ...}:
{
  # wayland.windowManager.hyprland = {
  #   enable = true;
  #   portalPackage = pkgs.xdg-desktop-portal-hyprland; # xdph none git
  #   xwayland.enable = true;
  #   systemd.enable = true;
  # };

  # home.file.".config/hypr/hyprland.conf".source = ./hyprland.conf;

  home.packages = with pkgs; [
    hyprland
    waybar
    hyprpaper
    hyprpolkitagent
    dunst
    udiskie
    wl-clip-persist
    nwg-look
    wl-clipboard
    wofi
    networkmanagerapplet
    brightnessctl
    hyprls
  ];
}
