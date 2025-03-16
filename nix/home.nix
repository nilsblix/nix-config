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
        ".zshrc".source = ../modules/zsh/zshrc;
        ".config/nvim".source = ../modules/nvim;
        ".config/alacritty".source = ../modules/alacritty;
        ".tmux.conf".source = ../modules/tmux/tmux.conf;
        ".config/starship".source = ../modules/starship;
        ".config/karabiner".source = ../modules/karabiner; # installed with brew
        "Library/Application Support/Leader Key".source = ../modules/leader-key; # installed with brew
    };
}
