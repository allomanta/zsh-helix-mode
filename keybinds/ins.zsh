local function bind() {
  bindkey -M hxins "$@"
}

bind '^[' _hx-cmd-mode
bind '^[[3~' .delete-char
