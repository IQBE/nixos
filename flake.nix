{
  description = "Main flake for IQBE's configurations";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, ... }@inputs:
    let
      system = "x86_64-linux";
      #pkgs = nixpkgs.legacyPackages.${system};
      #pkgsUnstable = nixpkgs-unstable.legacyPackages.${system};
      pkgs = import nixpkgs { inherit system; config.allowUnfree = true; };
      pkgsUnstable = import nixpkgs-unstable { inherit system; config.allowUnfree = true; };
    in
    {
      nixosConfigurations = {
        desktop = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs pkgs pkgsUnstable; };
          modules = [
            ./hosts/desktop/configuration.nix
            inputs.home-manager.nixosModules.default
          ];
        };
      };
    };
}

