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

    outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager, nix-homebrew }: let
        mkSystem = import ./lib/mksystem.nix {
            inherit nixpkgs inputs;
        };
    in {
        darwinConfigurations."nilsblix" = mkSystem "macbook-pro-m1" {
            system = "aarch64-darwin";
            user = "nilsblix";
            darwin = true;
        };
    };
}
