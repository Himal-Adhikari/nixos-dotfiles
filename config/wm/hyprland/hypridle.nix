# hypridle.nix
{ pkgs, ... }:

let
  dimScript = pkgs.writeShellScript "hypridle-dim" ''
    STATE_FILE="/tmp/brightness-state"

    if [ ! -f "$STATE_FILE" ]; then
      ${pkgs.brightnessctl}/bin/brightnessctl -m i | cut -d',' -f4 | tr -d '%' > "$STATE_FILE"
    fi

    ${pkgs.brightnessctl}/bin/brightnessctl set 10% > /dev/null
  '';

  undimScript = pkgs.writeShellScript "hypridle-undim" ''
    STATE_FILE="/tmp/brightness-state"

    if [ -f "$STATE_FILE" ]; then
      ${pkgs.brightnessctl}/bin/brightnessctl set "$(cat "$STATE_FILE")%" > /dev/null
      rm -f "$STATE_FILE"
    fi
  '';

  onAC = "${pkgs.gnugrep}/bin/grep -q 1 /sys/class/power_supply/AC*/online 2>/dev/null";
  onBattery = "! ${onAC}";
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
        # AC POWER: dim after 15 min, lock after 20 min
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

        # Battery POWER: dim after 5 min, lock after 10 min
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

