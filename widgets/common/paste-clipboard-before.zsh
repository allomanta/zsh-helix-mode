_hx-paste-clipboard-before() {
  local text=$(wl-paste)
  if [[ $MARK -le $CURSOR ]]; then
    BUFFER=${BUFFER:0:$MARK}$text${BUFFER:$MARK}
    CURSOR=$CURSOR+${#text}
  else
    BUFFER=${BUFFER:0:$CURSOR}$text${BUFFER:$CURSOR}
    MARK=$MARK+${#text}
  fi
}
zle -N _hx-paste-clipboard-before
