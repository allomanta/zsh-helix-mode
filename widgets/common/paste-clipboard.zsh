_hx-paste-clipboard() {
  local reply REPLY
  _hx-clipboard-paste || return
  _hx-selection-range
  _hx-put $reply[2] $reply[2] "$REPLY"
}
zle -N _hx-paste-clipboard
