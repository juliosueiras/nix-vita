{ stdenv, lib, fetchFromGitHub, gcc, ... }:

stdenv.mkDerivation {
  name = "libkirk";

  src = fetchFromGitHub {
    owner = "tpunix";
    repo = "kirk_engine";
    rev = "ee09e86b743d1c147579ff21f46dd0874303daf3";
    sha256 = "0z45iv643adld41y0lca086kpyh05hm5ng1n1gpyzkishw5dp63k";
  };

  buildPhase = ''
    cd kirk; make
  '';

  buildInputs = [
    gcc
  ];

  installPhase = ''
    mkdir -p $out/{include,lib}
    cp libkirk.so $out/lib/libkirk.so
    cp *.h $out/include
  '';

  patches = [
    ./fix.patch
  ];

  doCheck = false;

}
