_hx-append-eol() {
  zle .vi-add-eol
  MARK=$CURSOR
}
zle -N _hx-append-eol
