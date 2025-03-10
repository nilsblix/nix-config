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
        yazi
        fzf
        eza
        starship
        skhd
	];

    home.file = {
        ".zshrc".source = ~/dotfiles/configs/zsh/zshrc;
        ".config/nvim".source = ~/dotfiles/configs/nvim;
        ".config/alacritty".source = ~/dotfiles/configs/alacritty;
        ".tmux.conf".source = ~/dotfiles/configs/tmux/tmux.conf;
        ".config/yazi".source = ~/dotfiles/configs/yazi;
        ".config/starship".source = ~/dotfiles/configs/starship;
        ".config/skhd".source = ~/dotfiles/configs/skhd;
    };
}
