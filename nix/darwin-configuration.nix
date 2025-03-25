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
            "signal"
			"karabiner-elements"
			"leader-key"
		];
		onActivation.cleanup = "zap";
	};

	fonts.packages = with pkgs; [
		nerd-fonts.hack
        nerd-fonts.iosevka
	];

    imports = [
        ../modules/darwin/defaults.nix
    ];

	programs.zsh.enable = true;

    users.users.nilsblix.home = "/Users/nilsblix";
}
