_hx-paste-clipboard-replace-selection() {
  local text=$(wl-paste)
  zle _hx-delete
  if [[ $CURSOR -ne 0 ]]; then 
    (( ++CURSOR ))
  fi
  LBUFFER+=$text
}
zle -N _hx-paste-clipboard-replace-selection
