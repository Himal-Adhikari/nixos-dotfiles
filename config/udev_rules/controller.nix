{ pkgs, ... }:
{
  services.udev.packages = with pkgs; [
    game-devices-udev-rules
  ];

  services.udev.extraRules = ''
    KERNEL=="uinput", GROUP="input", MODE="0660", OPTIONS+="static_node=uinput"
  '';
}
