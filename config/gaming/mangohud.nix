{ ... }:
{
  programs.mangohud = {
    enable = true;

    settings = {
      fps_limit = 60;
      vsync = 3; # 0=adaptive 1=off 2=mailbox 3=on

      # Visual
      preset = 3;
      gpu_stats = true;
      gpu_list = 1;
      cpu_stats = true;
      fps = true;
      frametime = true;
      throttling_status = true;
      frame_timing = true;
      text_outline = true;

      no_display = true;
      toggle_hud = "Shift_L+F12";
    };
  };
}
