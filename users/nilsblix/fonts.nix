{ pkgs, ... }: {
    fonts.packages = with pkgs; [
        nerd-fonts.hack
        nerd-fonts.fira-code
        nerd-fonts.meslo-lg
        nerd-fonts.roboto-mono
    ];
}
