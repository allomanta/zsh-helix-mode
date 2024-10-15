autoload -Uz edit-command-line
zle -N edit-command-line

_hx-edit-command-line() {
  zle _hx-select-line
  zle edit-command-line
}
zle -N _hx-edit-command-line
