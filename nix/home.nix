{ config, pkgs, ... }:

{
    home.username = "nilsblix";
    home.homeDirectory = "/Users/nilsblix";

    home.stateVersion = "23.05";

    programs.home-manager.enable = true;

    home.packages = with pkgs; [
        zig_0_14
		nodejs_23
        python39
        cargo
        tokei
        neovim
        alacritty
        tmux
        fzf
        eza
        yazi
    ];

    home.file = {
        # shared
        ".zshrc".source = ../modules/shared/zsh/zshrc;
        ".config/nvim".source = ../modules/shared/nvim;
        ".config/alacritty".source = ../modules/shared/alacritty;
        ".tmux.conf".source = ../modules/shared/tmux/tmux.conf;

        # darwin
        ".config/karabiner".source = ../modules/darwin/karabiner; # installed with brew
        "Library/Application Support/Leader Key".source = ../modules/darwin/leader-key; # installed with brew
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
