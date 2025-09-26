{pkgs, config, ...}:
{
    programs.lutris = {
      enable = true;

      protonPackages = with pkgs; [
        proton-ge-bin
      ];

      winePackages = with pkgs; [
        wineWowPackages.full
      ];

      extraPackages = with pkgs; [
        mangohud
        winetricks
        gamescope
      ];

      defaultWinePackage = pkgs.proton-ge-bin;

      runners.wine.settings.system = {
        mangohud = true;
        gamescope = false;
        gamescope_fsr_sharpness = 1.0;
        gamescope_fps_limiter = 60;
      };
      runners.wine.settings.runner = {
        battleye = false;
        eac = false;
        esync = false;
      };
  };
}
