{ stdenv, lib, boost, fetchFromGitHub, cmake, curl, clang, ... }:

let 
  boostSharedStatic = boost.override { enableShared = false; enabledStatic = true; };
in stdenv.mkDerivation {
  name = "psvpfsparser";

  patches = [] ++ stdenv.lib.optional stdenv.isDarwin ./osx.patch;

  src = fetchFromGitHub {
    owner = "motoharu-gosuto";
    repo = "psvpfstools";
    rev = "cdde1cb7430fcc5d67c9f87a02dcc1eb27d37b18";
    sha256 = "0562gb83z8pvl7dm4v13avs1avgmiq27hq4060w4smdxqf5m4660";
  };

  preConfigure = ''
    cd cmake
  '';
  
  buildInputs = [
    curl
    boostSharedStatic
    cmake
  ];

  meta = with lib; {
    description = "Tools for decrypting PS Vita PFS filesystem";
    homepage = https://github.com/motoharu-gosuto/psvpfstools;
    maintainers = with maintainers; [ motoharu-gosuto ];
    platforms = platforms.linux ++ platforms.darwin;
  };
}
