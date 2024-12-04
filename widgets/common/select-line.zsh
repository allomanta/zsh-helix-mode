_hx-select-line() {
  current=$CURSOR
  CURSOR=$(($MARK+1))
  zle .beginning-of-line
  if [[ $CURSOR != $(($MARK+1)) ]]; then
    zle .set-mark-command
  fi
  CURSOR=$current
  zle .end-of-line
}
zle -N _hx-select-line 
