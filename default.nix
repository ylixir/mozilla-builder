with import <nixpkgs> {};
[
  mercurial
  python2
  (import ./nixpkgs-mozilla/release.nix {}).gecko.x86_64-linux.gcc
]
