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
		];
		onActivation.cleanup = "zap";
	};

	fonts.packages = with pkgs; [
		nerd-fonts.hack
        nerd-fonts.iosevka
	];

    imports = [
        ../modules/darwin/mac_options.nix
    ];

	programs.zsh.enable = true;

    users.users.nilsblix.home = "/Users/nilsblix";
}
