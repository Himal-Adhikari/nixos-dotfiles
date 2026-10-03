{ pkgs, ... }:
{
  home.packages = with pkgs; [
    (arduino-ide.overrideAttrs (old: {
        postFixup = (old.postFixup or "") + ''
          wrapProgram $out/bin/arduino-ide --add-flags "--ozone-platform=x11"
        '';
    }))
  ];
}
