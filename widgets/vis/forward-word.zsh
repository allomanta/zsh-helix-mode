_hx-forward-word() {
  zle .vi-forward-word
  ((--CURSOR))
}
zle -N _hx-forward-word
