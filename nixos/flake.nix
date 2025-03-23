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

    yandex-music.url = "github:cucumber-sp/yandex-music-linux";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      stylix,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
        config.packageOverrides = pkgs: {
          ktalk = pkgs.callPackage ./pkgs/ktalk.nix { };
        };
      };
    in
    {
      nixosConfigurations = {
        shire = nixpkgs.lib.nixosSystem {
          inherit system pkgs;
          specialArgs = { inherit self inputs; };
          modules = [
            ./hardware-configuration.nix
            self.nixosModules.default
            home-manager.nixosModules.home-manager
            stylix.nixosModules.stylix
            inputs.yandex-music.nixosModules.default
          ];
        };
      };
      nixosModules.default = ./modules;
    };
}
