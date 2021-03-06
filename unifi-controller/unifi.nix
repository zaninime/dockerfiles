{ stdenv, autoPatchelfHook, systemd, writers, jre8_headless, dpkg, src }:

let
  inherit (src) version;
  baseName = "unifi-controller";

  launchScript = writers.writeBash "${baseName}-boot-${version}" ''
    set -euo pipefail

    MY_DIR="$(dirname "$(readlink -f "$0")")"
    BASE_DIR="$(readlink -f "$MY_DIR/..")"

    JVM_EXTRA_OPTS="''${JVM_EXTRA_OPTS:-}"
    JVM_OPTS="$JVM_EXTRA_OPTS -Djava.awt.headless=true -Dfile.encoding=UTF-8"

    cd "$BASE_DIR"

    exec "${jre8_headless}/bin/java" $JVM_OPTS -jar "$BASE_DIR/lib/ace.jar" "$@"
  '';

in stdenv.mkDerivation {
  pname = baseName;
  inherit version src;

  nativeBuildInputs = [ autoPatchelfHook ];
  buildInputs = [ systemd stdenv.cc.cc ];
  dontBuild = true;

  unpackPhase = ''
    ${dpkg}/bin/dpkg -x $src .
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp -ar usr/lib/unifi/{dl,lib,webapps} $out
    cp ${launchScript} $out/bin/${baseName}
  '';
}
