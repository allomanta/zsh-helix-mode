_hx-forward-blank-word() {
  local start=$CURSOR
  zle .vi-forward-blank-word
  if (( CURSOR != start + 1 || CURSOR == ${#BUFFER} )); then
    CURSOR=$start
  fi
  zle .set-mark-command
  zle .vi-forward-blank-word
  ((--CURSOR))
}
zle -N _hx-forward-blank-word
