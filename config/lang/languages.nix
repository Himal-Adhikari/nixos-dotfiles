{ ... }:
{
  imports = [
    ./embeeded.nix
    ./c_cpp.nix
    ./python.nix
    ./rust.nix
    ./arduino.nix
    ./stm32.nix
    ./octave.nix
    ./rerun.nix
    ./sqlite.nix
    ./latex.nix
    ./typst.nix
  ];

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };
}
