{ config, pkgs, nix-homebrew, ... }:

{
	system.stateVersion = 4;
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
	    		"google-chrome"
			"karabiner-elements"
			"leader-key"
		];
		onActivation.cleanup = "zap";
	};

	system.defaults = {
		dock.autohide = true;
		controlcenter.Sound = true;
		controlcenter.Bluetooth = true;
		controlcenter.NowPlaying = false;
	};

	    power.sleep = {
		computer = 50;
		display = 30;
	    };

    networking = {
        computerName = "Nilss Macbook Pro 14";
        hostName = "nvb-nix-darwin";
        localHostName = "nvb-nix-darwin"; 
    };

	fonts.packages = [
		pkgs.nerd-fonts.hack
	];

	programs.zsh.enable = true;

	users.users.nilsblix.home = "/Users/nilsblix";
}
