_vis-backward-char() {
  if [[ $MARK == $CURSOR ]]; then
    (( ++MARK ))
  fi
  zle .vi-backward-char
}
zle -N _vis-backward-char
