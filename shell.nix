{ pkgs ? import <nixpkgs> {} }:
with pkgs;
stdenv.mkDerivation {
  name = "thunderbird";
  buildInputs = import ./default.nix;
}
