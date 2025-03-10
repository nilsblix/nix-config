{ config, pkgs, ... }:

{
	home.username = "nilsblix";
	home.homeDirectory = "/Users/nilsblix";

	home.stateVersion = "23.05";

	programs.home-manager.enable = true;

	home.packages = with pkgs; [
		hello
		neovim
		alacritty
        tmux
	];
}
