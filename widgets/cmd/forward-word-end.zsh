_hx-word-class() {
  case $1 in
    ([[:blank:]]) REPLY=blank ;;
    ([[:alnum:]_]) REPLY=word ;;
    ([[:punct:]]) REPLY=punct ;;
    (*) REPLY=other ;;
  esac
}

_hx-forward-word-end() {
  zle .set-mark-command
  local cur=${BUFFER:$CURSOR:1} next=${BUFFER:$CURSOR+1:1} cur_class REPLY
  if [[ -n $next && $cur != [[:space:]] ]]; then
    _hx-word-class $cur; cur_class=$REPLY
    _hx-word-class $next
    [[ $REPLY != $cur_class ]] && ((++MARK))
  fi
  zle .vi-forward-word-end
}
zle -N _hx-forward-word-end
