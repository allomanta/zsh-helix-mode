function bind() {
  bindkey -M hxcmd "$@"
}

bind : execute-named-cmd

# Change modes
bind i vi-insert
bind a vi-add-next
bind v _hx-vis-mode

# Char movement
bind h _wrapped-vi-backward-char
bind j _wrapped-down-line-or-history
bind k _wrapped-up-line-or-history
bind l _wrapped-vi-forward-char

# Word movement
bind w _wrapped-vi-forward-word
bind e _wrapped-vi-forward-word-end

# Line movement
bind "gg" _wrapped-beginning-of-buffer-or-history
bind "gs" _wrapped-beginning-of-line

# Find
bind f vi-find-next-char
bind F vi-find-prev-char
bind t vi-find-next-char-skip
bind T vi-find-prev-char-skip
bind n vi-repeat-search
bind N vi-rev-repeat-search

# Replace
bind r vi-replace-chars

# Copy Paste
bind y vi-yank
bind p vi-put-after

# Lines
bind o vi-open-line-below 
bind O vi-open-line-above

# misc
bind ~ vi-swap-case
bind u undo
bind d vi-delete

autoload -Uz edit-command-line
zle -N edit-command-line
bind m edit-command-line
