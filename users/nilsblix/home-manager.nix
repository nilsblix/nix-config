{ inputs, ... }:

{ config, lib, pkgs, ... }: let
    isDarwin = pkgs.stdenv.isDarwin;
    hidden =
        if builtins.pathExists ./git.nix.hidden then import ./git.nix.hidden
        else { userEmail = "noreply@example.com"; };
in {
    home.username = "nilsblix";
    home.homeDirectory = "/Users/nilsblix";

    home.stateVersion = "23.05";

    programs.home-manager.enable = true;

    home.packages = with pkgs; [ # alphabetical order
        git
        gh
        zsh
        bash
        fish

        ripgrep
        home-manager

        alacritty
        cargo
        eza
        fzf
        neovim
        sesh
        tmux
        tokei
        yazi
        zoxide

        nodejs_23
        python39
        zig_0_14

        spotify
    ] ++ (if isDarwin then [
        raycast
        aerospace
    ] else []);

    home.file = {
        ".config/nvim".source = ./nvim;
        ".config/alacritty.toml".source = ./alacritty.toml;
    } // (if isDarwin then {
        ".config/aerospace/aerospace.toml".source = ./aerospace.toml;
        ".config/karabiner/karabiner.json".source = ./karabiner.json;
    } else {});

    imports = [
        ./tmux.nix
        ./shells.nix
    ];

    programs.git = {
        enable = true;
        userName = "nilsblix";
        userEmail = hidden.userEmail;

        extraConfig = {
            github.user = "nilsblix";
            credential.helper = "osxkeychain";
        };
    };
}
