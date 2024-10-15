_hx-forward-char() {
  zle vi-forward-char
  zle .set-mark-command
}
zle -N _hx-forward-char
