{ config, pkgs, ... }:

{
    home.username = "nilsblix";
    home.homeDirectory = "/Users/nilsblix";

    home.stateVersion = "23.05";

    programs.home-manager.enable = true;

    home.packages = with pkgs; [ # alphabetical order
        aerospace
        alacritty
        cargo
        eza
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
        # shared
        ".zshrc".source = ../modules/shared/zsh/zshrc;
        ".config/nvim".source = ../modules/shared/nvim;
        ".config/alacritty".source = ../modules/shared/alacritty;
        ".tmux.conf".source = ../modules/shared/tmux/tmux.conf;

        # darwin
        ".config/aerospace/aerospace.toml".source = ../modules/darwin/aerospace.toml;
        ".config/karabiner/karabiner.json".source = ../modules/darwin/karabiner.json; # installed with brew
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
