{ pkgs, ... }:

let
  dimScript = pkgs.writeShellScript "hypridle-dim" ''
    STATE_FILE="/tmp/hypridle-brightness"

    if [ ! -f "$STATE_FILE" ]; then
      ${pkgs.brightnessctl}/bin/brightnessctl -m get | cut -d',' -f4 | tr -d '%' > "$STATE_FILE"
    fi

    ${pkgs.brightnessctl}/bin/brightnessctl set 10% > /dev/null
  '';

  undimScript = pkgs.writeShellScript "hypridle-undim" ''
    STATE_FILE="/tmp/hypridle-brightness"

    if [ -f "$STATE_FILE" ]; then
      ${pkgs.brightnessctl}/bin/brightnessctl set "$(cat "$STATE_FILE")%" > /dev/null
      rm -f "$STATE_FILE"
    fi
  '';

  isOnACScript = pkgs.writeShellScript "hypridle-is-on-ac" ''
    for supply in /sys/class/power_supply/*/type; do
      if [ "$(cat "$supply" 2>/dev/null)" = "Mains" ]; then
        online_file="''${supply%type}online"
        if [ -f "$online_file" ] && [ "$(cat "$online_file" 2>/dev/null)" = "1" ]; then
          exit 0
        fi
      fi
    done
    exit 1
  '';

  onAC = "${isOnACScript}";
  onBattery = "! ${isOnACScript}";
in
{
  home.packages = with pkgs; [
    brightnessctl
  ];

  services.hypridle = {
    enable = true;

    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock";
        before_sleep_cmd = "loginctl lock-session";
        after_sleep_cmd = "hyprctl dispatch dpms on";
      };

      listener = [
        # AC POWER: dim at 15 min, lock at 20 min
        {
          timeout = 900;
          on-timeout = "${dimScript}";
          on-resume = "${undimScript}";
          condition_cmd = onAC;
          condition_retry = 5;
        }
        {
          timeout = 1200;
          on-timeout = "loginctl lock-session";
          condition_cmd = onAC;
          condition_retry = 5;
        }

        # BATTERY POWER: dim at 5 min, suspend at 10 min
        {
          timeout = 300;
          on-timeout = "${dimScript}";
          on-resume = "${undimScript}";
          condition_cmd = onBattery;
          condition_retry = 5;
        }
        {
          timeout = 600;
          on-timeout = "systemctl suspend";
          condition_cmd = onBattery;
          condition_retry = 5;
        }
      ];
    };
  };
}

