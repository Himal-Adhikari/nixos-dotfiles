{pkgs, ...}:
{
  home.packages = with pkgs; [
    mangohud
  ];
  programs.lutris = {
    enable = true;

    protonPackages = with pkgs; [
      proton-ge-bin
    ];

    winePackages = with pkgs; [
      wineWow64Packages.full
    ];

    extraPackages = with pkgs; [
      winetricks
      gamescope
      mangohud
      gamemode
    ];

    defaultWinePackage = pkgs.proton-ge-bin;

    runners.wine.settings.system = {
      # wine-ge deferred its swapchain presentation on the GTX 1050 Ti (580
      # driver), so games rendered into a buffer but weren't shown until the
      # present loop got kicked ("renders only after a while"). Loading the
      # MangoHud layer hooks the swapchain and forces continuous presentation,
      # which fixes it. The overlay itself is hidden by default via the
      # home-manager MangoHud config (no_display, see mangohud.nix); the layer
      # still loads while hidden, so the fix holds without a visible HUD.
      mangohud = true;
    };
    runners.wine.settings.runner = {
      battleye = false;
      eac = false;
      esync = true;
      fsync = true;
    };
  };
}
