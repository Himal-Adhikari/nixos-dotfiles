{
  description = "Nixos config flake";

  inputs = {
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-kicad.url = "github:nixos/nixpkgs/69ee1d82f1fa4c70a3dc9a64111e7eef3b8e4527";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-index-database.url = "github:nix-community/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-stable,
    nixpkgs-kicad,
    home-manager,
    ...
  } @ inputs: let
    inherit (self) outputs;
    system = "x86_64-linux";
    stable = import nixpkgs-stable {
      inherit system;
    };
    kicad-nix = import nixpkgs-kicad {
      inherit system;
    };
    pkgs = nixpkgs.legacyPackages.${system};
  in {
     nixosConfigurations = {
      himal = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit stable kicad-nix inputs outputs;
        };
        modules = [
          ./configuration.nix
        ];
      };
    };

    homeConfigurations = {
      himal = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {
          inherit stable kicad-nix outputs;
        };
        modules = [
          ./home.nix
          inputs.nix-index-database.homeModules.nix-index
        ];
      };
    };
  };
}
