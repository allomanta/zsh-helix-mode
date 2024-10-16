local function bind() {
  bindkey -M hxvis "$@"
}

bind '^[' _hx-cmd-mode

bind : execute-named-cmd

# Change modes
bind i _hx-insert
bind a _hx-append
bind I .vi-insert-bol
bind A .vi-add-eol

# Char movement
bind h _vis-backward-char
bind j _vis-down-line-or-history
bind k _vis-up-line-or-history
bind l _vis-forward-char

# Word movement
bind w _vis-forward-word
bind W _vis-forward-blank-word
bind e _vis-forward-word-end
bind E _vis-forward-blank-word-end
bind b _vis-backward-word
bind B _vis-backward-blank-word

# Line movement
bind "gg" _vis-beginning-of-buffer-or-history
bind "ge" _vis-end-of-buffer-or-history
bind "gs" _vis-first-non-blank
bind "gh" _vis-beginning-of-line
bind "gl" _vis-end-of-line

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
bind o _hx-open-line-below 
bind O _hx-open-line-above
bind J _hx-join
bind '>' _hx-indent
bind '<' _hx-unindent
bind x _hx-select-line


# misc
bind '^[[200~' .bracketed-paste
bind '~' .vi-swap-case
bind u .undo
bind U .redo
bind d _hx-delete
bind c _hx-change
bind "^M" .accept-line

bind ' h' _hx-edit-command-line
