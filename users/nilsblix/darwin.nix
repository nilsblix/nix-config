{ inputs, pkgs, ...}: 

{
    users.knownUsers = [ "nilsblix" ];
    users.users.nilsblix.uid = 501;
    users.users.nilsblix = {
        home = "/Users/nilsblix";
        shell = pkgs.fish;
    };

    imports = [
        ./fonts.nix
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

    system = {
        defaults = {
            dock = {
                autohide = true;
                show-recents = false;

                wvous-tl-corner = 5; # start screensaver
                wvous-bl-corner = 10; # put display to sleep
                wvous-tr-corner = 1; # off
                wvous-br-corner = 1; # off
            };
            controlcenter = {
                Sound = true;
                Bluetooth = true;
                NowPlaying = false;
            };

            NSGlobalDomain = {
                KeyRepeat = 2; # how long between each repeat
                InitialKeyRepeat = 20; # how long before repeating
            };

            CustomUserPreferences = {
                "com.apple.screensaver" = {
                    askForPassword = true;
                    askForPasswordDelay = 0;
                };
            };
        };
    };

    power.sleep = {
        computer = 50;
        display = 30;
    };
}
