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
        brews = [
            "node@23"
        ];
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

	fonts.packages = [
		pkgs.nerd-fonts.hack
	];

	programs.zsh.enable = true;

	users.users.nilsblix.home = "/Users/nilsblix";
}
