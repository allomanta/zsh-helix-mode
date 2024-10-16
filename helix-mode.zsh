local project_root="${0:a:h}"
if (( ${+FILE_MANAGER} == 0 )); then
  FILE_MANAGER=yazi
fi

# Create helix keymaps
bindkey -N hxins emacs
bindkey -N hxcmd
bindkey -N hxvis

# Bind insert mode to main keymap
bindkey -A hxins main

# Source keybindings
source "$project_root"/keybinds/cmd.zsh
source "$project_root"/keybinds/ins.zsh
source "$project_root"/keybinds/vis.zsh

# Source widgets
for f ("$project_root"/widgets/**/*.zsh(N.))  source $f

export KEYTIMEOUT=1
source "$project_root"/cursor.zsh
cursor_mode

