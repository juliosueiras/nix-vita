{ stdenv, lib, fetchFromGitHub, cmake, openssl_1_1, ... }:

stdenv.mkDerivation {
  name = "chovy-gen";

  src = fetchFromGitHub {
    owner = "dots-tb";
    repo = "chovy-gen";
    rev = "2fd80b2ca72ef46f5b217bd55870ccd4432b339a";
    sha256 = "1iapqn7ki1z1xvdy7yd4qx6rfwr6gyncnj461iss4fwc2qziak3r";
  };

  buildInputs = [ openssl_1_1 ];

  doCheck = false;

  patches = [
    ./fix_makefile.patch
  ];

  postInstall = ''
    mkdir $out/bin
    cp chovy-gen $out/bin/chovy-gen
  '';

  meta = with lib; {
    description = "Generate __sce_ebootpbp for the vita";
    homepage = https://github.com/dots-tb/chovy-gen;
    maintainers = with maintainers; [ dots-tb ];
    platforms = platforms.linux ++ platforms.darwin;
  };
}
