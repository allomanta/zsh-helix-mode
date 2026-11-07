_hx-paste-before() {
  local reply
  _hx-selection-range
  _hx-put $reply[1] $reply[1] "$CUTBUFFER"
}
zle -N _hx-paste-before
