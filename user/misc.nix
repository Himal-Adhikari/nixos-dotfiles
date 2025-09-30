{pkgs, ...}:
{
  home.packages = with pkgs; [
    pavucontrol
    ffmpeg
    speedtest-rs
    suwayomi-server
    localsend

    # Nix lsp
    nil

    dpkg
    patchelf
    fastfetch
  ];
}
