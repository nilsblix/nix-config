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
        ".zshrc".source = ./zshrc;
        ".config/nvim".source = ./nvim;
        ".config/alacritty.toml".source = ./alacritty.toml;
        # ".tmux.conf".source = ./tmux.conf;
    } // (if isDarwin then {
        ".config/aerospace/aerospace.toml".source = ./aerospace.toml;
        ".config/karabiner/karabiner.json".source = ./karabiner.json;
    } else {});

    imports = [
        ./tmux.nix
    ];

    programs.fish = {
        enable = true;
        interactiveShellInit = lib.strings.concatStrings (lib.strings.intersperse "\n" ([
            (builtins.readFile ./config.fish) 
        ]));
        shellAliases = {
            drs = "darwin-rebuild switch --flake";
            vim = "nvim";
            l = "ls -al";
        };
    };

    programs.bash = {
        enable = true;
        shellAliases = {
            vim = "nvim";
            l = "ls -al";
        };
        initExtra = ''
            PS1="bash->\u@\h:\w\$ "
        '';
    };

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
