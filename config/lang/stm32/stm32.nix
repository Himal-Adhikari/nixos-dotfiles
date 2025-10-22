{ pkgs, ...}:
  let stm32cube-monitor = pkgs.callPackage ./default.nix { };
in
{
  home.packages = with pkgs; [
    stm32cubemx
    gcc-arm-embedded
    stm32cube-monitor
  ];
}
