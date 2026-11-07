_hx-paste() {
  local reply
  _hx-selection-range
  _hx-put $reply[2] $reply[2] "$CUTBUFFER"
}
zle -N _hx-paste
