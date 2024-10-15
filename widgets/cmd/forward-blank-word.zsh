_hx-forward-blank-word() {
  zle .set-mark-command
  zle .vi-forward-blank-word
  ((--CURSOR))
}
zle -N _hx-forward-blank-word
