{config, pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    catppuccin-sddm
  ];

  services.displayManager.sddm = {
    enable = true;
    theme = "catppuccin-mocha-mauve";
  };

  services.displayManager.defaultSession = "hyprland";
}
