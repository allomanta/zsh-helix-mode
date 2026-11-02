_hx-forward-word() {
  local start=$CURSOR
  zle .vi-forward-word
  if (( CURSOR != start + 1 || CURSOR == ${#BUFFER} )); then
    CURSOR=$start
  fi
  zle .set-mark-command
  zle .vi-forward-word
  ((--CURSOR))
}
zle -N _hx-forward-word
