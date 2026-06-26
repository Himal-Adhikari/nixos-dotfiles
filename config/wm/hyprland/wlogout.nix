{...}:
{
  programs.wlogout = {
    enable = true;
    layout = [
      {
          "label" = "lock";
          "action" = "loginctl lock-session";
          "text" = "Lock";
          "keybind" = "l";
      }
      {
          "label" = "logout";
          "action" = "loginctl terminate-user $USER";
          "text" = "Logout";
          "keybind" = "L";
      }
      {
          "label" = "suspend";
          "action" = "systemctl suspend";
          "text" = "Suspend";
          "keybind" = "s";
      }
      {
          "label" = "hibernate";
          "action" = "systemctl hibernate";
          "text" = "Hibernate";
          "keybind" = "h";
      }
      {
          "label" = "shutdown";
          "action" = "systemctl poweroff";
          "text" = "Shutdown";
          "keybind" = "S";
      }
      {
          "label" = "reboot";
          "action" = "systemctl reboot";
          "text" = "Reboot";
          "keybind" = "r";
      }
    ];
  };
}
