{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { self, nixpkgs, home-manager, ... }@inputs:
    {
      nixosConfigurations = {
        shire = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit self inputs; };
          modules = [
            ./hardware-configuration.nix
            home-manager.nixosModules.default
            self.nixosModules.default
          ];
        };
      };
      nixosModules.default = ./modules;
    };
}
