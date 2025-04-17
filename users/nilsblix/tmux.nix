{ pkgs, ... }: {
    programs.tmux = {
        enable = true;
        plugins = with pkgs; [
            tmuxPlugins.tmux-fzf
        ];
        extraConfig = ''
            set -g default-terminal "xterm-256color"
            set -ga terminal-overrides ",xterm-256color:Tc"

            unbind r
            bind r source-file ~/.config/tmux/tmux.conf\; display-message "Config reloaded..."

            # tmux sesh
            unbind t
            bind "t" run-shell "sesh connect \"$(
              sesh list --icons | fzf-tmux -p 100%,100% \
                --no-sort --ansi --prompt '->  ' \
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
