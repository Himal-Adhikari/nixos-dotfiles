{ pkgs, ... }:
{
  home.packages = with pkgs; [
    pavucontrol
    ffmpeg
    dpkg
    patchelf
    fastfetch
    p7zip
    usbutils
    speedtest-rs

    popsicle
    gnome-disk-utility
  ];
}
