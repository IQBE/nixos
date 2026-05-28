{
  description = "Main flake for IQBE's configurations";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvf = {
      url = "github:NotAShelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, nvf, ... }@inputs:
    let
      system = "x86_64-linux";

      mkPkgs = pkg-input:
        import pkg-input {
	inherit system;
	config.allowUnfree = true;
      };

      pkgs = mkPkgs nixpkgs;
      pkgsUnstable = mkPkgs nixpkgs-unstable;
    in
    {
      nixosConfigurations = {
        desktop = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs pkgsUnstable; };
          modules = [
            ./hosts/desktop/configuration.nix
            home-manager.nixosModules.home-manager
	    nvf.nixosModules.default
          ];
        };
      };
    };
}
