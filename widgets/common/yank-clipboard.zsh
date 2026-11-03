_hx-yank-clipboard() {
  local text
  if [[ $MARK -le $CURSOR ]]; then
    text=${BUFFER:$MARK:$((CURSOR-MARK+1))}
  else
    text=${BUFFER:$CURSOR:$((MARK-CURSOR))}
  fi
  print -rn -- $text | _hx-clipboard-copy
}
zle -N _hx-yank-clipboard
