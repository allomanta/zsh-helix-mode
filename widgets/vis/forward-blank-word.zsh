_vis-forward-blank-word() {
  local start=$CURSOR
  zle .vi-forward-blank-word
  if (( CURSOR == start + 1 && CURSOR < ${#BUFFER} )); then
    zle .vi-forward-blank-word
  fi
  ((--CURSOR))
}
zle -N _vis-forward-blank-word
