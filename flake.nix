{
  description = "Nixos config flake";

  inputs = {
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

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
    home-manager,
    ...
  } @ inputs: let
    inherit (self) outputs;
    system = "x86_64-linux";
    stable = import nixpkgs-stable {
      inherit system;
    };
    pkgs = nixpkgs.legacyPackages.${system};
  in {
     nixosConfigurations = {
      himal = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit stable inputs outputs;
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
          inherit stable outputs;
        };
        modules = [
          ./home.nix
          inputs.nix-index-database.homeModules.nix-index
        ];
      };
    };
  };
}
