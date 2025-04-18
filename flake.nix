{
  description = "Glens flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ags.url = "github:Aylur/ags";
    nixos-cosmic.url = "github:lilyinstarlight/nixos-cosmic";
  };

  outputs = { self, nixpkgs, nixos-cosmic, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
    in {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
       {
            nix.settings = {
                substituters = [ "https://cosmic.cachix.org/" ];
                trusted-public-keys = [ "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE=" ];
            };
        }
        nixos-cosmic.nixosModules.default
        ./system/configuration.nix
      ];
    };
    homeConfigurations.glen = home-manager.lib.homeManagerConfiguration {
      pkgs = import nixpkgs { inherit system; };
      extraSpecialArgs = { inherit inputs; };
      modules = [ ./home/home.nix ];
    };
  };
}
