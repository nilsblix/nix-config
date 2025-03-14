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
        ".zshrc".source = ~/dotfiles/configs/zsh/zshrc;
        ".config/nvim".source = ~/dotfiles/configs/nvim;
        ".config/alacritty".source = ~/dotfiles/configs/alacritty;
        ".tmux.conf".source = ~/dotfiles/configs/tmux/tmux.conf;
        ".config/starship".source = ~/dotfiles/configs/starship;
        ".config/karabiner".source = ~/dotfiles/configs/karabiner; # installed with brew
        "Library/Application Support/Leader Key".source = ~/dotfiles/configs/leader-key;
    };
}
