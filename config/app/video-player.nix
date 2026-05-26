{pkgs, ...}:
{
  home.packages = with pkgs; [
    vlc
  ];

  programs.mpv = {
    enable = true;
    config = {
      slang = "eng,en";
      sid = "auto";
    };
    profiles = {
      anime-settings = {
        profile-cond="string.match(path, \"Anime/\") ~= nil";
        alang="jpn,jp";
        slang = "enm,eng,en";
      };
    };
  };
}
