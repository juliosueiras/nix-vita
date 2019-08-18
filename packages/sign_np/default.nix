#{ stdenv, lib, fetchFromGitHub, cmake, openssl_1_1, ... }:
with import <nixpkgs> {};

stdenv.mkDerivation {
  name = "sign_np";

  src = fetchFromGitHub {
    owner = "swarzesherz";
    repo = "sign_np";
    rev = "ac77d56e13b5c6c60564100699560d12ff3f425f";
    sha256 = "1vaw67hmgg9wcnp30aykhblhkbmkqs38l6xmi530gyvhvzmxjg5a";
  };

  buildInputs = [ gcc zlib ];

  installPhase = ''
    mkdir -p $out/bin
    cp sign_np $out/bin
  '';

  patches = [] ++ stdenv.lib.optional stdenv.isDarwin ./osx.patch;

  doCheck = false;

  meta = with lib; {
    description = "Tool to encrypt and sign PSP ISO images into PSN PBP files.";
    homepage = https://github.com/dots-tb/chovy-gen;
    maintainers = with maintainers; [ swarzesherz ];
    platforms = platforms.linux ++ platforms.darwin;
  };
}
