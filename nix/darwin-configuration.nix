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
            "google-chrome"
			"raycast"
			"karabiner-elements"
            "signal"
			"spotify"
			"surfshark"
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

    users.knownUsers = [ "nilsblix" ];
    users.users.nilsblix.uid = 501;
    users.users.nilsblix = {
        home = "/Users/nilsblix";
        shell = pkgs.zsh;
    };
    
    programs.zsh.enable = true;
    programs.fish.enable = true;

}
