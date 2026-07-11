{ ... }:
{
  # MangoHud config, managed by home-manager -> ~/.config/MangoHud/MangoHud.conf
  # Backbone is the set of options that were enabled in the previous hand-written
  # config. The overlay is hidden by default (no_display) and toggled on demand
  # with Shift_L+F12. Note: even while hidden, the MangoHud layer stays loaded,
  # which is what forces wine-ge games to actually present frames (see lutris.nix).
  programs.mangohud = {
    enable = true;

    settings = {
      # Performance
      fps_limit = 60;
      vsync = 3; # 0=adaptive 1=off 2=mailbox 3=on

      # Visual
      preset = 3; # extended layout
      gpu_stats = true;
      cpu_stats = true;
      fps = true;
      frametime = true;
      throttling_status = true;
      frame_timing = true;
      text_outline = true;

      # Hidden by default; press the toggle key to show it.
      no_display = true;
      toggle_hud = "Shift_L+F12";
    };
  };
}
