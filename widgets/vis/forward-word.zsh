_vis-forward-word() {
  local start=$CURSOR
  zle .vi-forward-word
  if (( CURSOR == start + 1 && CURSOR < ${#BUFFER} )); then
    zle .vi-forward-word
  fi
  ((--CURSOR))
}
zle -N _vis-forward-word
