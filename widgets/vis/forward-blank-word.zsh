_vis-forward-blank-word() {
  zle .vi-forward-blank-word
  ((--CURSOR))
}
zle -N _vis-forward-blank-word
