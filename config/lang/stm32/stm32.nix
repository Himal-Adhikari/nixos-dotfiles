{ pkgs, ...}:
  let
    stm32cube-monitor = pkgs.callPackage ./default.nix { };
    cubeprogrammer = pkgs.callPackage ./cube-programmer.nix { };
in
{
  home.packages = with pkgs; [
    stm32cubemx
    cubeprogrammer
    gcc-arm-embedded
    stm32flash
    stm32cube-monitor
  ];
}
