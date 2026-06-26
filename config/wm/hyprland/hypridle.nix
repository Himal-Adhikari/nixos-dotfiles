{pkgs, ...}:
let
  lockScript = pkgs.writeShellScript "hypridle-lock" ''
    ${pkgs.procps}/bin/pidof hyprlock || ${pkgs.hyprlock}/bin/hyprlock &
    sleep 5
    ${pkgs.hyprland}/bin/hyprctl dispatch dpms off
  '';

  idleScript = pkgs.writeShellScript "hypridle-idle-action" ''
    if ${pkgs.gnugrep}/bin/grep -q 1 /sys/class/power_supply/AC*/online 2>/dev/null; then
      ${pkgs.systemd}/bin/loginctl lock-session
    else
      ${pkgs.systemd}/bin/systemctl suspend
    fi
  '';
in
{
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "${lockScript}";
        before_sleep_cmd = "${pkgs.systemd}/bin/loginctl lock-session";
        after_sleep_cmd = "${pkgs.hyprland}/bin/hyprctl dispatch dpms on";
      };
      listener = [
        {
          timeout = 1800;
          on-timeout = "${idleScript}";
        }
      ];
    };
  };
}
