{ pkgs, ... }:
{
  imports = [
    ./stm32/stm32.nix
  ];

  home.packages = with pkgs; [
    # stable.arduino-ide
    # arduino
  ];
}
