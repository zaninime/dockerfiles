{
  stdenv,
  autoPatchelfHook,
  systemd,
  writers,
  jre8_headless,
  dpkg,
}: let
  src = (import ../nix/sources.nix).unifi;
  baseName = "unifi";

  launchScript = writers.writeBash "${baseName}-boot-${src.version}" ''
    set -eu

    JVM_EXTRA_OPTS="''${JVM_EXTRA_OPTS:-}"
    JVM_OPTS="$JVM_EXTRA_OPTS -Djava.awt.headless=true -Dfile.encoding=UTF-8"

    exec "${jre8_headless}/bin/java" $JVM_OPTS -jar lib/ace.jar "$@"
  '';
in
  stdenv.mkDerivation {
    pname = baseName;
    inherit (src) version;

    inherit src;

    nativeBuildInputs = [autoPatchelfHook];
    buildInputs = [systemd stdenv.cc.cc];
    dontBuild = true;

    unpackPhase = ''
      ${dpkg}/bin/dpkg -x $src .
    '';

    configurePhase = ''
      rm -rfv usr/lib/unifi/lib/native/Linux/{aarch64,armv7}
      rm -rfv usr/lib/unifi/lib/native/{Mac,Windows}
    '';

    installPhase = ''
      mkdir -p $out/bin
      cp -ar usr/lib/unifi/{dl,lib,webapps} $out
      chmod -Rv a+x $out/lib/native/**/*
      cp ${launchScript} $out/bin/${baseName}
    '';
  }
