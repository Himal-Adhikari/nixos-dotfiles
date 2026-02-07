{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-index-database.url = "github:nix-community/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-unstable,
    home-manager,
    ...
  } @ inputs: let
    inherit (self) outputs;
    system = "x86_64-linux";
    unstable = import nixpkgs-unstable {
      inherit system;
      config.allowUnfree = true;
    };
  in {
     nixosConfigurations = {
      himal = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit unstable inputs outputs;
          username = "himal";
        };
        modules = [
          ./configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {
              inherit unstable inputs outputs;
              username = "himal";
            };
            home-manager.users.himal.imports = [
              ./home.nix
              inputs.nix-index-database.homeModules.nix-index
            ];
          }
        ];
      };
    };
  };
}
