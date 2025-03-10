{ config, pkgs, ... }:

{
	home.username = "nilsblix";
	home.homeDirectory = "/Users/nilsblix";

	home.stateVersion = "23.05";

	programs.home-manager.enable = true;

	home.packages = with pkgs; [
		neovim
		alacritty
        tmux
	];

    home.file = {
        ".config/nvim".source = ~/dotfiles/configs/nvim;
        ".config/alacritty".source = ~/dotfiles/configs/alacritty;
        ".tmux.conf".source = ~/dotfiles/configs/tmux/tmux.conf;
    };
}
