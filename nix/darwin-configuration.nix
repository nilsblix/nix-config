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
		# zig_0_13
        zig_0_14
		nodejs_23
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

	fonts.packages = [
		pkgs.nerd-fonts.hack
	];

    imports = [
        ../modules/darwin/defaults.nix
    ];

	programs.zsh.enable = true;

    users.users.nilsblix.home = "/Users/nilsblix";
}
