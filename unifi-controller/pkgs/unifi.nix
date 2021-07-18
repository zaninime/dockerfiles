{ stdenv, autoPatchelfHook, systemd, writers, jdk11_headless, dpkg }:

let
  src = (import ../nix/sources.nix).unifi;
  baseName = "unifi";

  launchScript = writers.writeBash "${baseName}-boot-${src.version}" ''
    set -eu

    JVM_EXTRA_OPTS="''${JVM_EXTRA_OPTS:-}"
    JVM_OPTS="$JVM_EXTRA_OPTS -Djava.awt.headless=true -Dfile.encoding=UTF-8"

    exec "${jdk11_headless}/bin/java" $JVM_OPTS -jar lib/ace.jar "$@"
  '';

in stdenv.mkDerivation {
  pname = baseName;
  version = src.version;

  inherit src;

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
