local project_root="${0:a:h}"

# Create helix keymaps
bindkey -N hxins emacs
bindkey -N hxcmd
bindkey -N hxvis visual

# Bind insert mode to main keymap
bindkey -A hxins main

# Source keybindings
source "$project_root"/keybinds/cmd.zsh
source "$project_root"/keybinds/ins.zsh
source "$project_root"/keybinds/vis.zsh

# TODO, better way needed
source "$project_root"/widgets/common/hx-command-mode.zsh

export KEYTIMEOUT=1
source "$project_root"/cursor.zsh
cursor_mode

