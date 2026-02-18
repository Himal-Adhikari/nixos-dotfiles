{ pkgs, username, ... }:
{
  programs.rmpc = {
    enable = true;
  };

  services.mpd = {
    enable = true;
    musicDirectory = "/home/${username}/Music";
  };

  home.packages = [
    pkgs.mpd
  ];

  home.file.".config/rmpc/config.ron" = {
    source = ./config.ron;
  };

  home.file.".config/rmpc/themes/Catppuccin_Macchiato.ron" = {
    source = ./theme.ron;
  };
}
