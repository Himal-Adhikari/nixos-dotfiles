{pkgs, ...}:
{
  home.packages = with pkgs; [
    ffmpeg
    pavucontrol
    ffmpeg
    gsettings-desktop-schemas
    gnome-themes-extra
    glib
  ];
}
