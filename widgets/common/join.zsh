_hx-join() {
  local old_mark=$MARK
  local old_cursor=$CURSOR
  NUMERIC=-1 zle .set-mark-command
  zle .vi-join
  zle .set-mark-command
  MARK=$old_mark
  CURSOR=$old_cursor
}
zle -N _hx-join
