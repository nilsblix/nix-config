{ pkgs, ... }: {
    programs.tmux = {
        enable = true;
        plugins = with pkgs; [
            tmuxPlugins.tmux-fzf
        ];
        extraConfig = ''
            unbind r
            bind r source-file ~/.config/tmux/tmux.conf\; display-message "Config reloaded..."

            # tmux sesh
            unbind t
            bind "t" run-shell "sesh connect \"$(
              sesh list --icons | fzf-tmux -p 80%,70% \
                --no-sort --ansi --border-label ' sesh ' --prompt '->  ' \
                # --header '  ^a all ^t tmux ^g configs ^x zoxide ^d tmux kill ^f find' \
                # --bind 'tab:down,btab:up' \
                # --bind 'ctrl-a:change-prompt(⚡  )+reload(sesh list --icons)' \
                # --bind 'ctrl-t:change-prompt(🪟  )+reload(sesh list -t --icons)' \
                # --bind 'ctrl-g:change-prompt(⚙️  )+reload(sesh list -c --icons)' \
                # --bind 'ctrl-x:change-prompt(📁  )+reload(sesh list -z --icons)' \
                # --bind 'ctrl-f:change-prompt(🔎  )+reload(fd -H -d 2 -t d -E .Trash . ~)' \
                # --bind 'ctrl-d:execute(tmux kill-session -t {2..})+change-prompt(⚡  )+reload(sesh list --icons)' \
                # --preview-window 'right:55%' \
                # --preview 'sesh preview {}'
            )\""

            unbind C-Space
            set -g prefix C-Space
            bind C-Space send-prefix

            unbind E
            bind E kill-window

            unbind l
            bind l switchc -l

            set -g mouse on

            set -sg escape-time 0

            set -g base-index 1
            set -g detach-on-destroy off

            # colors
            set -g message-style "bg=color88,fg=white"
            set -g mode-style "bg=color88,fg=white"

            # status bar
            set -g status-position bottom
            set -g status-justify absolute-centre

            set -g status-style "fg=#D0D0D0 bg=#000000"
            set -g window-status-current-style "fg=color1 bold"

            set -g status-left " #S "
            set -g status-right " #{=-40:#{pane_current_path}} "

            set -g status-left-length 100
            set -g status-right-length 100
        '';
    };
}
