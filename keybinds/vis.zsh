local function bind() {
  bindkey -M hxvis "$@"
}

bind '^[' _hx-cmd-mode
