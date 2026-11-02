_vis-forward-word() {
  zle .vi-forward-word
  ((--CURSOR))
}
zle -N _vis-forward-word
