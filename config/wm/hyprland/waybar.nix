{pkgs, config, ...}:
{
  programs.waybar = {
    enable = true;
    style = ./style.css;
  };

  xdg.configFile = {
    "waybar/config.jsonc".source = ./config.jsonc;
  };
}
