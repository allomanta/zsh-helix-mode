_hx-change() {
  if [[ $MARK -le $CURSOR ]]; then
    ((++CURSOR))
    zle .kill-region
    zle .vi-insert
  else
    zle .vi-change
  fi
}
zle -N _hx-change
