_hx-paste-replace-selection() {
  local reply
  _hx-selection-range
  _hx-put $reply[1] $reply[2] "$CUTBUFFER"
}
zle -N _hx-paste-replace-selection
