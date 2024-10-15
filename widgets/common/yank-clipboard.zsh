_hx-yank-clipboard() {
  if [[ $MARK -le $CURSOR ]]; then
    wl-copy <<< ${BUFFER:$MARK:$((CURSOR-MARK+1))}
  else
    echo huh ${BUFFER:$CURSOR:$((CURSOR-MARK+1))}
    wl-copy <<< ${BUFFER:$CURSOR:((MARK-CURSOR+1))}
  fi
}
zle -N _hx-yank-clipboard

