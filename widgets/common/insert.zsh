_hx-insert() {
  if [[ $MARK -lt $CURSOR ]]; then
    zle exchange-point-and-mark
  fi
  zle .vi-insert
}
zle -N _hx-insert
