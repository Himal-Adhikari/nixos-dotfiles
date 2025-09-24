{pkgs, ...}:
{
  programs.kitty = {
    enable = true;
    themeFile = "Catppuccin-Mocha";
    font = {
      size = 11.0;
      name = "JetBrains Mono";
    };
    extraConfig = ''
      background_opacity 1.0
      url color #5de4c7
      confirm_os_window_close 0
      map ctrl+tab send_text all \x1b[27;5;9~
      map ctrl+shift+tab send_text all \x1b[27;6;9~
    '';
  };
}
