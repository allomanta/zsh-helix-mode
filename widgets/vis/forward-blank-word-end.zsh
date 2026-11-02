_vis-forward-blank-word-end() {
  zle .vi-forward-blank-word-end
  if (( CURSOR == ${#BUFFER} && CURSOR > 0 )); then
    ((--CURSOR))
  fi
}
zle -N _vis-forward-blank-word-end
