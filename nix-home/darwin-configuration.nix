{ config, pkgs, nix-homebrew, ... }:

{
	system.stateVersion = 4;
	# services.nix-daemon.enable = true;
	ids.gids.nixbld = 350;

	nix.settings.experimental-features = "nix-command flakes";

	environment.systemPackages = with pkgs; [
		git
		gh
		zsh
		home-manager
		ripgrep
	];

	homebrew = {
		enable = true;
		casks = [
			"raycast"
			"surfshark"
            "spotify"
		];
		onActivation.cleanup = "zap";
	};

	system.defaults = {
		dock.autohide = true;
	};

	fonts.packages = [
		pkgs.nerd-fonts.hack
	];

	programs.zsh.enable = true;

	users.users.nilsblix.home = "/Users/nilsblix";
}
