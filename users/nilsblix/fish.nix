{ lib, ... }: {
    programs.fish = {
        enable = true;
        # interactiveShellInit = "clear";
        interactiveShellInit = lib.strings.concatStrings (lib.strings.intersperse "\n" ([
            "function fish_prompt"
            "echo (set_color white)$USER@(set_color cf1f22)$hostname(set_color white):(set_color blue)(prompt_pwd)(set_color yellow)'$ '"
            "end"
            "set -U fish_greeting"
            "set -U theme_color_scheme dracula"
        ]));
        shellAliases = {
            drs = "darwin-rebuild switch --flake";
            hms = "home-manager switch --flake";
            vim = "nvim";
            l = "ls -al";
        };
    };
}
