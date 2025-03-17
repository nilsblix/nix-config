{ config, pkgs, ... }:

{
	home.username = "nilsblix";
	home.homeDirectory = "/Users/nilsblix";

	home.stateVersion = "23.05";

	programs.home-manager.enable = true;

	home.packages = with pkgs; [
		tokei
		neovim
		alacritty
		tmux
		fzf
		eza
		starship
		zig_0_13
		nodejs_23
	];

    home.file = {
        # shared
        ".zshrc".source = ../modules/shared/zsh/zshrc;
        ".config/nvim".source = ../modules/shared/nvim;
        ".config/alacritty".source = ../modules/shared/alacritty;
        ".tmux.conf".source = ../modules/shared/tmux/tmux.conf;
        ".config/starship".source = ../modules/shared/starship;

        # darwin
        ".config/karabiner".source = ../modules/darwin/karabiner; # installed with brew
        "Library/Application Support/Leader Key".source = ../modules/darwin/leader-key; # installed with brew
    };
}
