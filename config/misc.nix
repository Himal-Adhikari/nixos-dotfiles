{pkgs, ...}:
{
  home.packages = with pkgs; [
    speedtest-rs
    # Nix lsp

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

    sqlitebrowser
  ];
}
