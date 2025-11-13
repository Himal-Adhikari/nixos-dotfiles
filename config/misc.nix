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
    newsflash
    picard
    cheese
    logseq

    usbutils
    universal-android-debloater
    android-tools
    sqlitebrowser
  ];
}
