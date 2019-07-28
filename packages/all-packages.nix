{ pkgs ? import <nixpkgs> {} }:

with pkgs;

{
  psvpfsparser = callPackage ./psvpfsparser/default.nix {};
}
