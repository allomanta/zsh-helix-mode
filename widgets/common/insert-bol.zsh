_hx-insert-bol() {
  zle .vi-insert-bol
  MARK=$CURSOR
}
zle -N _hx-insert-bol
