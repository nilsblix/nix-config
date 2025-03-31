function fish_prompt
   echo (set_color white)$USER@(set_color cf1f22)$hostname(set_color white):(set_color blue)(prompt_pwd)(set_color yellow)'$ '
end

function fish_user_key_bindings
  # bind \cc 'commandline | commandline ""; commandline -f repaint'
    # bind \cc 'commandline ""; commandline "hello world"'
    bind \cc 'echo; commandline ""; commandline -f repaint'
end

set -U fish_greeting
set -U theme_color_scheme dracula
