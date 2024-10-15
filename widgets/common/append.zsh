_hx-append() {
  if [[ $MARK -gt $CURSOR ]]; then
    zle exchange-point-and-mark
    (( --CURSOR ))
  fi
  zle .vi-add-next
}
zle -N _hx-append
