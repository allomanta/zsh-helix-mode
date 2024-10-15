_hx-forward-word() {
  zle .set-mark-command
  zle .vi-forward-word
  ((--CURSOR))
}
zle -N _hx-forward-word
