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
      wineWowPackages.full
    ];

    extraPackages = with pkgs; [
      winetricks
      gamescope
      mangohud
    ];

    defaultWinePackage = pkgs.proton-ge-bin;

    runners.wine.settings.system = {
      mangohud = false;
    };
    runners.wine.settings.runner = {
      battleye = false;
      eac = false;
      esync = false;
    };
  };
}
