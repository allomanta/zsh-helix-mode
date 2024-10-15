_hx-paste-replace-selection() {
  if [[ $MARK -le $CURSOR ]]; then
    ((++CURSOR))
    zle .put-replace-selection
    ((--CURSOR))
  else
    zle .put-replace-selection
  fi
}
zle -N _hx-paste-replace-selection
