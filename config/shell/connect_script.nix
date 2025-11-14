{
  lib,
  makeWrapper,
  runCommand,
  bash,
  curl,
}:

let
  src = ./connect-script.sh;
  binName = "pulchowk-connect";
  deps = [
    bash
    curl
  ];
in
runCommand "${binName}"
  {
    nativeBuildInputs = [ makeWrapper ];
    meta = {
      mainProgram = "${binName}";
    };
  }
  ''
    mkdir -p $out/bin
    install -m +x ${src} $out/bin/${binName}

    wrapProgram $out/bin/${binName} \
      --prefix PATH : ${lib.makeBinPath deps}
  ''
