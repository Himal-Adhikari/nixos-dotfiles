{ pkgs, ...}:
{
  programs.btop = {
    enable = true;
    settings = {
      color_theme = "tokyo-storm";
      theme_background = false;
      vim_keys = true;
      rounded_corners = true;
      show_battery = true;
    };
  };
}
