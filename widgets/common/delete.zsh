_hx-delete() {
  if [[ $MARK -le $CURSOR ]]; then
    ((++CURSOR))
    zle .kill-region
  else
    zle .kill-region
  fi
}
zle -N _hx-delete
