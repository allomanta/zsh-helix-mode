_hx-delete() {
  if [[ $MARK -le $CURSOR ]]; then
    ((++CURSOR))
    zle .kill-region
    ((--CURSOR))
  else
    zle .kill-region
  fi
}
zle -N _hx-delete
