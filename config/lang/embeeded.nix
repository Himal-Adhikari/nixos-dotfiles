{ pkgs, ... }:
{
  imports = [
    ./stm32/stm32.nix
  ];

  home.packages = with pkgs; [
    # arduino
    # arduino-ide
    (arduino-ide.overrideAttrs (old: {
        postFixup = (old.postFixup or "") + ''
          wrapProgram $out/bin/arduino-ide --add-flags "--ozone-platform=x11"
        '';
    }))
  ];
}
