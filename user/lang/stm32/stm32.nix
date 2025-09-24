{config, pkgs, ...}:
{
  home.packages = with pkgs; [
    stm32cubemx
    gcc-arm-embedded
  ];
}
