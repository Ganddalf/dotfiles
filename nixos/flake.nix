{
  description = "Ganddalf's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    vscode-ext = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:danth/stylix";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      nixosConfigurations = {
        shire = nixpkgs.lib.nixosSystem {
          inherit system pkgs;
          specialArgs = { inherit self inputs; };
          modules = [
            ./hardware-configuration.nix
            home-manager.nixosModules.home-manager
            self.nixosModules.default
          ];
        };
      };
      nixosModules.default = ./modules;
    };
}
