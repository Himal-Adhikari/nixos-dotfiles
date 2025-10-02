{pkgs, ...}:
{

  # nixpkgs.overlays = [
  #   (final: prev: {
  #     gamescope = prev.gamescope.overrideAttrs (old: {
  #       src = prev.fetchFromGitHub {
  #         owner = "ValveSoftware";
  #         repo = "gamescope";
  #         tag = "3.15.13";
  #         fetchSubmodules = true;
  #         hash = "sha256-O2pxaPDwEr9ko7Zplv65qRUDzIk1Q54Q7Rgs94VkTII=";
  #       };
  #       patches = (old.patches or []) ++ [
  #         (prev.fetchpatch {
  #           url = "https://github.com/ValveSoftware/gamescope/commit/4ce1a91fb219f570b0871071a2ec8ac97d90c0bc.diff";
  #           hash = "sha256-O358ScIIndfkc1S0A8g2jKvFWoCzcXB/g6lRJamqOI4=";
  #         })
  #       ];
  #     });
  #   })
  # ];

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
    ];

    defaultWinePackage = pkgs.proton-ge-bin;

    runners.wine.settings.system = {
      mangohud = false;
      # gamescope = true;
      # gamescope_fsr_sharpness = 1.0;
      # gamescope_fps_limiter = 60;
    };
    runners.wine.settings.runner = {
      battleye = false;
      eac = false;
      esync = false;
    };
  };
}
