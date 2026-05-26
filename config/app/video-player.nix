{pkgs, ...}:
{
  home.packages = with pkgs; [
    vlc
  ];

  programs.mpv = {
    enable = true;
    config = {
      alang = "jpn,jp,eng,en";
      slang = "eng,en";
      sid = "auto";
    };
  };
}
