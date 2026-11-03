_hx-paste-clipboard-replace-selection() {
  local text REPLY
  _hx-clipboard-paste || return
  text=$REPLY
  zle _hx-delete
  if [[ $CURSOR -ne 0 ]]; then 
    (( ++CURSOR ))
  fi
  LBUFFER+=$text
}
zle -N _hx-paste-clipboard-replace-selection
