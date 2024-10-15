_hx-backward-word() {
  ((++CURSOR))
  zle .set-mark-command
  ((--CURSOR))
  zle .vi-backward-word
}
zle -N _hx-backward-word
