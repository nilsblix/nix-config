{ inputs, ... }:

{ config, lib, pkgs, ... }: let
    isDarwin = pkgs.stdenv.isDarwin;
in {
    home.username = "nilsblix";
    home.homeDirectory = "/Users/nilsblix";

    home.stateVersion = "23.05";

    programs.home-manager.enable = true;

    home.packages = with pkgs; [ # alphabetical order
		git
		gh
        zsh
		home-manager
		ripgrep

        aerospace
        alacritty
        cargo
        eza
        fish
        fzf
        neovim
        nodejs_23
        python39
        tmux
        tokei
        yazi
        zig_0_14
    ];

    home.file = {
        ".zshrc".source = ./zshrc;
        ".config/nvim".source = ./nvim;
        ".config/alacritty.toml".source = ./alacritty.toml;
        ".tmux.conf".source = ./tmux.conf;
    } // (if isDarwin then {
        ".config/aerospace/aerospace.toml".source = ./aerospace.toml;
        ".config/karabiner/karabiner.json".source = ./karabiner.json;
    } else {});

    imports = [
        ./fish.nix
    ];

    programs.git = {
        enable = true;
        userName = "nilsblix";
        userEmail = "nilsblix06@gmail.com";

        extraConfig = {
            github.user = "nilsblix";
            credential.helper = "osxkeychain";
        };
    };
}
