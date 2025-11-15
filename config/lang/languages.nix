{ ... }:
{
  imports = [
    ./embeeded.nix
    ./c_cpp.nix
    ./python.nix
    ./rust.nix
    ./stm32/stm32.nix
  ];

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };
}
