{ pkgs,... }:
{
  home.packages = with pkgs; [
    cmake
    gnumake
    gcc
    libclang
    bear
  ];
}
