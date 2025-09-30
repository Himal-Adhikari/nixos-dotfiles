{ pkgs, ...}:
{

  nixpkgs.config.packageOverrides = pkgs: {
    stm32cube-monitor = pkgs.callPackage ./default.nix { };
  };

  home.packages = with pkgs; [
    stm32cubemx
    gcc-arm-embedded
    stm32cube-monitor
  ];
}
