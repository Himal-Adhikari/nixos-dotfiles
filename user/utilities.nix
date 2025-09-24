{pkgs, ...}:
{
  home.packages = with pkgs; [
    pavucontrol
    ffmpeg
    gsettings-desktop-schemas
    glib
  ];
}
