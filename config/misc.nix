{pkgs, ...}:
{
  home.packages = with pkgs; [
    pavucontrol
    ffmpeg
    speedtest-rs

    # Nix lsp
    nil

    dpkg
    patchelf
    fastfetch

    inkscape
    kicad
    vscode
    gimp
    picard
    cheese
    fluent-reader
    suwayomi-server
    linux-wifi-hotspot

    usbutils
    universal-android-debloater
    android-tools
    sqlitebrowser
  ];
}
