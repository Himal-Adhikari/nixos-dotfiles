{...}:
{
  programs.kitty = {
    enable = true;
    themeFile = "Catppuccin-Mocha";
    font = {
      size = 11.0;
      name = "JetBrainsMono Nerd Font";
    };
    extraConfig = ''
      # background_opacity 1.0
      # url color #5de4c7
      confirm_os_window_close 0

      # Reduce scroll tearing on NVIDIA/Wayland: force native Wayland backend
      # and sync frame rendering to the monitor's refresh.
      linux_display_server wayland
      sync_to_monitor yes
      map ctrl+tab send_text all \x1b[27;5;9~
      map ctrl+shift+tab send_text all \x1b[27;6;9~
    '';
  };
}
