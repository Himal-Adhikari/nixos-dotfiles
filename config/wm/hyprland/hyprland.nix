{pkgs, ...}:
{
  home.packages = with pkgs; [
    hyprpolkitagent
    dunst
    udiskie
    wl-clipboard
    networkmanagerapplet
    brightnessctl
    hyprls
    hyprpicker
    swaybg
  ];

  services.cliphist = {
    enable = true;
  };

  imports = [
    ./waybar.nix
    ./wlogout.nix
    ./wofi.nix
    ./hyprsunset.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    portalPackage = pkgs.xdg-desktop-portal-hyprland; # xdph none git
    xwayland.enable = true;
    systemd.enable = true;
    settings = {
      "monitor" = ",preferred,auto,1";

      "$mainMod" = "SUPER";
      "$terminal" = "kitty";
      "$fileManager" = "nautilus";
      "$menu" = "wofi --show drun --allow-images";
      "$executable_menu" = "wofi --show run";
      "$browser" = "librewolf";

      exec-once = [
        "systemctl --user start hyprpolkitagent"
        "udiskie"
        "nm-applet"
        "waybar"
        "hypr-wallpaper daemon"
        "swaybg -m fill -i $(\cat ~/.config/hypr/wallpaper-path.txt)"
        "battery-notification"
      ];

      env = [
        "HYPRCURSOR_SIZE,24"
      ];

      general = {
        "gaps_in" = 0;
        "gaps_out" = 0;
        "border_size" = 1;

        # https://wiki.hyprland.org/Configuring/Variables/#variable-types for info about colors
        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";

        # Set to true enable resizing windows by clicking and dragging on borders and gaps
        "resize_on_border" = false;

        # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
        "allow_tearing" = false;

        "layout" = "dwindle";
      };

      decoration = {
        "rounding" = 0;
        "rounding_power" = 2;

        # Change transparency of focused and unfocused windows
        "active_opacity" = 1.0;
        "inactive_opacity" = 1.0;

        shadow = {
          "enabled" = false;
        };

        blur = {
          "enabled" = false;
        };
      };

      animations = {
        "enabled" = false;
      };

      master = {
        "new_status" = "master";
      };

      misc = {
        "vfr" = true;
        "enable_anr_dialog" = false;
        "force_default_wallpaper" = 0;
        "disable_hyprland_logo" = true;
      };

      ecosystem = {
        "no_update_news" = true;
        "no_donation_nag" = true;
      };

      input = {
        "kb_layout" = "us";
        "kb_options" = "caps:escape";
        "follow_mouse" = 1;

        "sensitivity" = 0;

        touchpad = {
          "natural_scroll" = true;
        };
      };

      "gesture" = "3, horizontal, workspace";

      bind = [
        # General
        "$mainMod, RETURN, exec, $terminal"
        "$mainMod, B, exec, $browser"
        "$mainMod, Q, killactive,"
        "$mainMod, T, exec, $fileManager"
        "$mainMod, Space, togglefloating,"
        "$mainMod, R, exec, $menu"
        "$mainMod SHIFT, R, exec, $executable_menu"
        "$mainMod, escape, exec, wlogout --protocol layer-shell"
        "$mainMod, V, exec, cliphist list | wofi --dmenu | cliphist decode | wl-copy"
        "$mainMod, F, fullscreen"
        "$mainMod, W, exec, hypr-wallpaper"

        # Screenshot
        "$mainMod, PRINT, exec, hyprshot -m window"
        ", PRINT, exec, hyprshot -m output"
        "SHIFT, PRINT, exec, hyprshot -m region"

        # Special Workspace
        "$mainMod, S, togglespecialworkspace, magic"
        "$mainMod SHIFT, S, movetoworkspace, special:magic"

        # Browse workspace with mouse
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"

        # Workspace Control
        "$mainMod, H, movefocus, l"
        "$mainMod, L, movefocus, r"
        "$mainMod, K, movefocus, u"
        "$mainMod, J, movefocus, d"

        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"

        # Modifier Keys
        ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ", XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+"
        ", XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"

        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPause, exec, playerctl play-pause"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"
      ];

      bindm = [
        # Move windows with mouse
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
    };
  };

  programs.hyprlock = {
    enable = true;  
  };

  programs.hyprshot = {
    enable = true;  
    saveLocation = "$HOME/Pictures/Screenshots";
  };
}
