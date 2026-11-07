_hx-cmd-mode() {
  zle .split-undo
  zle -K hxcmd
}
zle -N _hx-cmd-mode
