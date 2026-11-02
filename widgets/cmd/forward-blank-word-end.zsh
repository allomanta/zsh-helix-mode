_hx-forward-blank-word-end() {
  zle .set-mark-command
  if [[ ${BUFFER:$CURSOR:1} != ([[:space:]]|) && ${BUFFER:$CURSOR+1:1} == [[:space:]] ]]; then
    ((++MARK))
  fi
  zle .vi-forward-blank-word-end
  # zsh's motion stops past the last char at the end of the buffer
  if (( CURSOR == ${#BUFFER} && CURSOR > 0 )); then
    ((--CURSOR))
  fi
}
zle -N _hx-forward-blank-word-end
