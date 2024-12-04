local function bind() {
  bindkey -M hxcmd "$@"
}

bind : execute-named-cmd

# Change modes
bind i _hx-insert
bind a _hx-append
bind v _hx-vis-mode
bind I .vi-insert-bol
bind A .vi-add-eol

# Char movement
bind h _hx-backward-char
bind j _hx-down-line-or-history
bind k _hx-up-line-or-history
bind l _hx-forward-char

bind "^[[D" _hx-backward-char
bind "^[[B" _hx-down-line-or-history
bind "^[[A" _hx-up-line-or-history
bind "^[[C" _hx-forward-char

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
bind " R" _hx-paste-clipboard-replace-selection

# Copy Paste
bind y _hx-yank
bind " y" _hx-yank-clipboard
bind p _hx-paste
bind P .vi-put-before
bind " p" _hx-paste-clipboard
bind " P" _hx-paste-clipboard-before

# Lines
bind o .vi-open-line-below 
bind O .vi-open-line-above
bind J _hx-join
bind '>' .vi-indent
bind '<' .vi-unindent
bind x _hx-select-line


# misc
bind '^[[200~' .bracketed-paste
bind '~' .vi-swap-case
bind u .undo
bind U .redo
bind d _hx-delete
bind c _hx-change
bind "^M" .accept-line
bind '^[' _hx-unselect
bind ' f' _hx-open-file-manager

bind ' h' _hx-edit-command-line
