_hx-paste-clipboard-replace-selection() {
  local reply REPLY
  _hx-clipboard-paste || return
  _hx-selection-range
  _hx-put $reply[1] $reply[2] "$REPLY"
}
zle -N _hx-paste-clipboard-replace-selection
