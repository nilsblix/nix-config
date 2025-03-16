{
  description = "nvb nix flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin = {
	url = "github:LnL7/nix-darwin/master";
        inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
 	url = "github:nix-community/home-manager";
	inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager, nix-homebrew }:
  let
	system = "aarch64-darwin";
  in
  {
	darwinConfigurations."nvb" = nix-darwin.lib.darwinSystem {
		inherit system;
		modules = [
			./nix/darwin-configuration.nix
			home-manager.darwinModules.home-manager
			{
				home-manager.useGlobalPkgs = true;
				home-manager.useUserPackages = true;
				home-manager.users.nilsblix = import ./nix/home.nix;
			}
			nix-homebrew.darwinModules.nix-homebrew
			{
				nix-homebrew.enable = true;
				nix-homebrew.enableRosetta = true;
				nix-homebrew.user = "nilsblix";
			}
		];
	};

	homeConfigurations."nilsblix" = home-manager.lib.homeManagerConfiguration {
		pkgs = nixpkgs.legacyPackages.${system};
		modules = [ ./nix/home.nix ];
	};
  };
}
