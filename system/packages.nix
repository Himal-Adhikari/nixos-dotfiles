{
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    coreutils-full
    vim
    curl
    mesa
  ];

  services.xserver.displayManager.gdm.enable = true;
  services.udisks2.enable = true;
  services.blueman.enable = true;

  programs.hyprland.enable = true;
  programs.dconf.enable = true;

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    
  ];

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
}

