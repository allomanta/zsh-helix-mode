_hx-backward-blank-word() {
  ((++CURSOR))
  zle .set-mark-command
  ((--CURSOR))
  zle .vi-backward-blank-word
}
zle -N _hx-backward-blank-word
