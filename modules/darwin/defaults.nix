{ config, ... }:

{
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
        hostName = "nix-darwin"; # this changes the one inside tmux
        localHostName = "nix-darwin"; 
    };
}
