_hx-paste-clipboard() {
  local text=$(wl-paste)
  if [[ $MARK -le $CURSOR ]]; then
    ((++CURSOR))
    LBUFFER+=$text
    ((--CURSOR))
  else
    BUFFER=${BUFFER:0:$MARK}$text${BUFFER:$MARK}
    MARK+=${#text}
  fi
}
zle -N _hx-paste-clipboard
