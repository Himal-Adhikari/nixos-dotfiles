{config, pkgs, ...}:
{
  programs.obsidian = {
    enable = true;
    defaultSettings.themes = ["Primary"];
  };
}
