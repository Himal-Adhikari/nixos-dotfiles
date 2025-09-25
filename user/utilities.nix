{pkgs, stable, ...}:
{
  home.packages = with pkgs; [
    pavucontrol
    ffmpeg
    speedtest-rs
  ];
}
