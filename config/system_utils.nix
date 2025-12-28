{ pkgs, ... }:
{
  home.packages = with pkgs; [
    pavucontrol
    ffmpeg
    dpkg
    patchelf
    fastfetch
    p7zip
    popsicle
    usbutils
    speedtest-rs
  ];
}
