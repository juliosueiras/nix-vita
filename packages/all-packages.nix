{ pkgs ? import <nixpkgs> {} }:

with pkgs;

{
  psvpfsparser = callPackage ./psvpfsparser/default.nix {};
  psvimgtools = callPackage ./psvimgtools/default.nix {};
  signnp = callPackage ./sign_np/default.nix {};
  chovy-gen = callPackage ./chovy-gen/default.nix {};
  libkirk = callPackage ./kirk_engine/default.nix {};
}
