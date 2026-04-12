{ pkgs, ... }:

let
  scriptContent = ''
    #!/usr/bin/env bash

    BAT=$(ls /sys/class/power_supply | grep BAT | head -n 1)
    low_sent=false
    critical_sent=false
    POLLING_INTERVAL=60

    while true; do
      if [ -f "/sys/class/power_supply/$BAT/capacity" ]; then
        CAPACITY=$(cat "/sys/class/power_supply/$BAT/capacity")
        STATUS=$(cat "/sys/class/power_supply/$BAT/status")

        if [ "$STATUS" = "Discharging" ]; then
          if [ "$CAPACITY" -le 20 ] && [ "$critical_sent" = false ]; then
            notify-send -u critical "Battery Critical" "Level: $CAPACITY%"
            critical_sent=true
          elif [ "$CAPACITY" -le 95 ] && [ "$low_sent" = false ]; then
            notify-send -u normal "Battery Low" "Level: $CAPACITY%"
            low_sent=true
          fi
        else
          low_sent=false
          critical_sent=false
        fi
      fi
      sleep $POLLING_INTERVAL
    done
  '';
in
{
  home.packages = with pkgs; [
    (writeScriptBin "battery-notification" scriptContent)
    libnotify
  ];
}
