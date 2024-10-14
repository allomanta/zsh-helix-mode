function bind() {
  bindkey -M hxcmd "$@"
}

bind : execute-named-cmd

# Change modes
bind i _hx-insert
bind a _hx-add-next
bind v _hx-vis-mode
bind I .vi-insert-bol
bind A .vi-add-eol

# Char movement
bind h _hx-backward-char
bind j _hx-down-line-or-history
bind k _hx-up-line-or-history
bind l _hx-forward-char

# Word movement
bind w _hx-forward-word
bind W _hx-forward-blank-word
bind e _hx-forward-word-end
bind E _hx-forward-blank-word-end
bind b _hx-backward-word
bind B _hx-backward-blank-word

# Line movement
bind "gg" _hx-beginning-of-buffer-or-history
bind "ge" _hx-end-of-buffer-or-history
bind "gs" _hx-first-non-blank
bind "gh" _hx-beginning-of-line
bind "gl" _hx-end-of-line

# Match brackets
bind "mm" .vi-match-bracket


# Find
bind f .vi-find-next-char
bind F .vi-find-prev-char
bind t .vi-find-next-char-skip
bind T .vi-find-prev-char-skip
bind n .vi-repeat-search
bind N .vi-rev-repeat-search

# Replace
bind r .vi-replace-chars
bind R _hx-paste-replace-selection

# Copy Paste
bind y _hx-yank
bind " y" _hx-yank-to-clipboard
bind p _hx-paste
bind P .vi-put-before
bind " p" _hx-paste-from-clipboard
bind " P" _hx-paste-before-from-clipboard

# Lines
bind o .vi-open-line-below 
bind O .vi-open-line-above
bind J .vi-join
bind '>' .vi-indent -n 1
bind '<' .vi-unindent -n 1
bind x _hx-select-line


# misc
bind '^[[200~' .bracketed-paste
bind ~ .vi-swap-case
bind u .undo
bind U .redo
bind d _hx-delete
bind c _hx-change
bind "^M" .accept-line
bind '^[' _hx-unselect

autoload -Uz .edit-command-line
zle -N .edit-command-line
bind m .edit-command-line
