{ pkgs, ... }:
{
  imports = [
    ./stm32/stm32.nix
  ];

  home.packages = with pkgs; [
    arduino
    arduino-ide
  ];
}
