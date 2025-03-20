{ config, ... }:

{
    system = {
        defaults = {
            dock = {
                autohide = true;
                show-recents = false;
            };
            controlcenter = {
                Sound = true;
                Bluetooth = true;
                NowPlaying = false;
            };

            NSGlobalDomain = {
                KeyRepeat = 3; # how long between each repeat
                InitialKeyRepeat = 15; # how long before repeating
            };

            CustomUserPreferences = {
                "com.apple.screensaver" = {
                    askForPassword = 1;
                    askForPasswordDelay = 0;
                };
            };
        };
    };

    power.sleep = {
        computer = 50;
        display = 30;
    };

    networking = {
        computerName = "Nilss Macbook Pro 14";
        hostName = "nix-darwin"; # this changes the one inside tmux
        localHostName = "nix-darwin"; 
    };

    security.pam.services.sudo_local.touchIdAuth = true;
}
