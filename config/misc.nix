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
    p7zip

    inkscape
    kicad
    vscode
    gimp
    picard
    cheese
    gnome-calculator
    calibre
    octaveFull
    rerun

    usbutils
    universal-android-debloater
    android-tools
    sqlitebrowser
  ];
}
