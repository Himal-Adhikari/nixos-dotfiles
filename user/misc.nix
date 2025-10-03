{pkgs, ...}:
{
  home.packages = with pkgs; [
    pavucontrol
    ffmpeg
    speedtest-rs
    suwayomi-server

    # Nix lsp
    nil

    dpkg
    patchelf
    fastfetch
    inkscape
    linux-wifi-hotspot
    kicad

    usbutils
    android-tools
  ];
}
