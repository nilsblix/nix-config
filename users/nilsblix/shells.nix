{ lib, ... }: {
    programs.zsh = {
        enable = true;
        shellAliases = {
            vim = "nvim";
            l = "eza --long --all";
            ls = "eza";
            la = "eza --all";
            ll = "eza --long";
            cd = "z";
            drs = "darwin-rebuild switch --flake";
        };
        initExtraFirst = ''
            source <(fzf --zsh)
            eval "$(zoxide init zsh)"
        '';
        initExtra = ''
            PROMPT='%F{#4bc287}╭%F{#20536d}%n%F{#460854}@%F{#98c5a0}%m%F{#DEDEDE}:%F{#5777a1}%~%f
            %F{#4bc287}╰─> %F{#DEDEDE}'
        '';
    };

    programs.fish = {
        enable = true;
        interactiveShellInit = lib.strings.concatStrings (lib.strings.intersperse "\n" ([
            (builtins.readFile ./config.fish) 
        ]));
        shellAliases = {
            drs = "darwin-rebuild switch --flake";
            vim = "nvim";
            l = "ls -al";
        };
    };

    programs.bash = {
        enable = true;
        shellAliases = {
            vim = "nvim";
            l = "ls -al";
        };
        initExtra = ''
            PS1="bash->\u@\h:\w\$ "
        '';
    };
}
