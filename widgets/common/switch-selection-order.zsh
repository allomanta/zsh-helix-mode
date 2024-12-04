_hx-switch-selection-order() {
  current=$CURSOR
  CURSOR=$MARK
  MARK=$current
}
zle -N _hx-switch-selection-order 
