{ stdenv, autoPatchelfHook, systemd, writeScript, fetchdeb, jdk, version, sha256
}:

let
  baseName = "unifi-controller";

  launchScript = writeScript "${baseName}-boot-${version}" ''
    #!${stdenv.shell}
    set -euo pipefail

    MY_DIR="$(dirname "$(readlink -f "$0")")"
    BASE_DIR="$(readlink -f "$MY_DIR/..")"

    JVM_EXTRA_OPTS="''${JVM_EXTRA_OPTS:-}"
    JVM_OPTS="$JVM_EXTRA_OPTS -Djava.awt.headless=true -Dfile.encoding=UTF-8"

    cd "$BASE_DIR"

    exec "${jdk}/bin/java" $JVM_OPTS -jar "$BASE_DIR/lib/ace.jar" "$@"
  '';

in stdenv.mkDerivation {
  inherit version;
  pname = baseName;

  src = fetchdeb {
    url = "https://dl.ui.com/unifi/${version}/unifi_sysvinit_all.deb";
    inherit sha256;
  };

  nativeBuildInputs = [ autoPatchelfHook ];
  buildInputs = [ systemd stdenv.cc.cc ];
  dontBuild = true;

  installPhase = ''
    mkdir -p $out/bin
    cp -ar usr/lib/unifi/{dl,lib,webapps} $out
    cp ${launchScript} $out/bin/${baseName}
  '';
}
