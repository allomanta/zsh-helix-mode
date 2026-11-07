_hx-paste-clipboard-before() {
  local reply REPLY
  _hx-clipboard-paste || return
  _hx-selection-range
  _hx-put $reply[1] $reply[1] "$REPLY"
}
zle -N _hx-paste-clipboard-before
