_hx-replace() {
  local reply char text mark=$MARK cursor=$CURSOR
  read -k 1 char || return
  [[ $char == $'\e' ]] && return
  [[ $char == $'\r' ]] && char=$'\n'
  _hx-selection-range
  text=${BUFFER:$reply[1]:$(( reply[2] - reply[1] ))}
  BUFFER=${BUFFER:0:$reply[1]}${text//[^$'\n']/$char}${BUFFER:$reply[2]}
  MARK=$mark CURSOR=$cursor REGION_ACTIVE=1
}
zle -N _hx-replace
