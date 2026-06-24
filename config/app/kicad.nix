{ pkgs, ... }:

let
  kicadThemed = pkgs.symlinkJoin {
    name = "kicad-themed-${pkgs.kicad.version}";
    paths = [ pkgs.kicad ];
    nativeBuildInputs = [ pkgs.makeWrapper ];
    postBuild = ''
      for bin in kicad kicad-cli eeschema pcbnew gerbview pl_editor \
                 bitmap2component pcb_calculator; do
        if [ -e "$out/bin/$bin" ]; then
          wrapProgram "$out/bin/$bin" \
            --set GTK_THEME 'Adwaita:dark' \
            --prefix XDG_DATA_DIRS : '${pkgs.gnome-themes-extra}/share'
        fi
      done
    '';
  };
in
{
  home.packages = [
    kicadThemed
  ];
}
