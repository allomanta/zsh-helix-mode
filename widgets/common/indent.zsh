_hx-map-lines() {
  local old=$1 pos before line col
  local -a old_lines=("${(@ps:\n:)old}") new_lines=("${(@ps:\n:)BUFFER}")
  reply=()
  for pos in $@[2,-1]; do
    before=${old:0:$pos}
    line=$(( ${#${before//[^$'\n']}} + 1 ))
    col=$(( ${#${before##*$'\n'}} + ${#new_lines[line]} - ${#old_lines[line]} ))
    (( col < 0 )) && col=0
    reply+=($(( ${#${(pj:\n:)new_lines[1,line-1]}} + (line > 1) + col )))
  done
}

_hx-reindent() {
  local reply old=$BUFFER mark=$MARK cursor=$CURSOR
  _hx-selection-range
  MARK=$reply[1]
  CURSOR=$(( reply[2] > reply[1] ? reply[2] - 1 : reply[1] ))
  REGION_ACTIVE=1
  zle .$1
  _hx-map-lines "$old" $mark $cursor
  MARK=$reply[1] CURSOR=$reply[2] REGION_ACTIVE=1
}

_hx-indent() {
  _hx-reindent vi-indent
}
_hx-unindent() {
  _hx-reindent vi-unindent
}
zle -N _hx-indent
zle -N _hx-unindent
