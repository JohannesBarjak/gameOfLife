{
  description = "A flake for game of life";

  outputs = { self, nixpkgs ? import <nixpkgs> }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
    pkgName = "gameOfLife";
    haskPkgs = pkgs.haskell.packages.ghc964;

  in {
    packages.${system}.${pkgName} = haskPkgs.developPackage { root  = ./.; };
    defaultPackage.${system} = self.packages.${system}.${pkgName};

    devShells = {
      ${system}.default = pkgs.mkShell {
        buildInputs = [
          ( haskPkgs.ghcWithPackages ( p: [
            p.haskell-language-server
            p.ghcid
            p.cabal-install
          ]))

          pkgs.pkg-config
          pkgs.SDL2
        ];
      };
    };
  };
}
