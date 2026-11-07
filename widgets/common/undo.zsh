_hx-restore-selection() {
  local sel=${_hx_selections[$BUFFER]}
  [[ -n $sel ]] || return
  MARK=${sel% *} CURSOR=${sel#* } REGION_ACTIVE=1
}

_hx-undo() {
  zle .undo || return
  _hx-restore-selection
}
_hx-redo() {
  zle .redo || return
  _hx-restore-selection
}
zle -N _hx-undo
zle -N _hx-redo
