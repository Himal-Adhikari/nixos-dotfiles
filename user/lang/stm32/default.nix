{ stdenv, lib, pkgs }:
let 
  version = "1.11.0";
  pkg_name = "stm32cubemon-lin-v-${
      builtins.replaceStrings [ "." ] [ "-" ] version
    }";
in

stdenv.mkDerivation {
  name = "stm32cubemonitor";
  inherit version;

  src = pkgs.requireFile {
    name = "${pkg_name}.zip";
    url = "https://www.st.com/en/development-tools/stm32cubemonitor.html";
    sha256 = "0i992x0ci8wa98ckdk30ihsmjgim1syq1kdp4k1pqxiwb9mrza5a";
  };

  buildInputs = with pkgs; [ dpkg unzip ];

  dontConfigure = true;
  dontBuild = true;
 
  unpackPhase = "true";

  installPhase = ''
    runHook preInstall

    mkdir -p $out
    ls -la $src
    unzip $src -d "${pkg_name}"
    dpkg-deb --fsys-tarfile "${pkg_name}/stm32cubemonitor_${version}_amd64.deb" | \
    tar -x --no-same-owner
    mv usr $out
    cp -av $out/usr/* $out
    rm -rf $out/usr

    substituteInPlace \
    $out/share/applications/stm32cubemonitor.desktop \
    --replace /opt/ $out/opt/

    runHook postInstall
  '';

  preFixup = let
    libPath = with pkgs; lib.makeLibraryPath [
      glib
      nspr
      nss
      dbus
      gtk3
      pango
      libx11
      libxrandr
      libxcb
      at-spi2-atk
      cups
      cairo
      xorg.libXcomposite
      xorg.libXdamage
      libxfixes
      libgbm
      expat
      libxkbcommon
      systemd
      alsa-lib
      nwjs-ffmpeg-prebuilt
      libxext
    ];
  in ''
    patchelf \
    --set-interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" \
    --set-rpath "${libPath}" \
    $out/bin/stm32cubemonitor
  '';

  meta = with lib; {
    description = "STM32 Cube Monitor";
    homepage = "https://www.st.com/en/development-tools/stm32cubemonitor.html";
    license = licenses.mit;
    maintainers = with stdenv.lib.maintainers; [ himal ];
    platforms = platforms.unix;
  };
}


