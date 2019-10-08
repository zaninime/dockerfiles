{ stdenv, autoPatchelfHook, systemd, writeScript, fetchdeb, makeWrapper, jre
, version, sha256 }:

let pname = "unifi-controller";

in stdenv.mkDerivation {
  inherit version pname;

  src = fetchdeb {
    url = "https://dl.ui.com/unifi/${version}/unifi_sysvinit_all.deb";
    inherit sha256;
  };

  nativeBuildInputs = [ autoPatchelfHook makeWrapper ];
  buildInputs = [ systemd stdenv.cc.cc ];
  dontBuild = true;

  installPhase = ''
    mkdir -p $out/bin
    cp -ar usr/lib/unifi/{dl,lib,webapps} $out

    makeWrapper "${jre}/bin/java" $out/bin/${pname} \
      --set JVM_OPTS "\$JVM_EXTRA_OPTS -Djava.awt.headless=true -Dfile.encoding=UTF-8" \
      --add-flags "\$JVM_OPTS -jar $out/lib/ace.jar"
  '';
}
