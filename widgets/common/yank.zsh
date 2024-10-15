_hx-yank() {
  if [[ $MARK -le $CURSOR ]]; then
    ((++CURSOR))
    zle .copy-region-as-kill
    ((--CURSOR))
  else
    zle .copy-region-as-kill
  fi
}
zle -N _hx-yank
