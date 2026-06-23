{ pkgs, fetchFromGitHub }:
let
  flavor = "catppuccin-mocha";
in 
pkgs.stdenv.mkDerivation {
  pname = "yazi-flavor-${flavor}";
  version = "2026-03-03";
  src = fetchFromGitHub {
    owner = "yazi-rs";
    repo = "flavors";
    rev = "c02c804bb7c8873da8182745654fb57dc63b7348";
    hash = "sha256-ZXJx4iwGCAi6qqDiLSuJvX3UL6XzypxSO7ptspDD/Yw=";
  };

  installPhase = ''
    mkdir -p $out
    cp $src/${flavor}.yazi/* $out/
  '';
}
