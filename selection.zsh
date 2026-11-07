# zsh turns the selection highlight off on every buffer change,
# turn it back on when typing in insert mode with a selection
typeset -gi _hx_selection
# The selection last seen with each version of the buffer, for undo
typeset -gA _hx_selections
_hx-keep-selection() {
  if [[ $KEYMAP != main ]]; then
    _hx_selection=0
  else
    if (( _hx_selection && !REGION_ACTIVE && MARK != CURSOR )); then
      REGION_ACTIVE=1
    fi
    _hx_selection=$(( REGION_ACTIVE && MARK != CURSOR ))
    if (( !_hx_selection )); then
      MARK=$CURSOR
    fi
  fi
  _hx_selections[$BUFFER]="$MARK $CURSOR"
}
# Don't leave the selection highlighted on accepted lines
_hx-clear-selection() {
  REGION_ACTIVE=0
  _hx_selections=()
}
autoload -Uz add-zle-hook-widget
zle -N _hx-keep-selection
zle -N _hx-clear-selection
add-zle-hook-widget line-pre-redraw _hx-keep-selection
add-zle-hook-widget line-finish _hx-clear-selection
