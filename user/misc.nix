{pkgs, stable, ...}:
{
  home.packages = with pkgs; [
    pavucontrol
    ffmpeg
    speedtest-rs
    suwayomi-server
    localsend
  ];
}
