{ pkgs ? import <nixpkgs> {} }:

{
  vitaPackages = import packages/all-packages.nix { inherit pkgs; };
}
