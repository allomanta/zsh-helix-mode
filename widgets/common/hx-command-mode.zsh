bef_wrap=(
  vi-forward-word 
  vi-forward-word-end
)

for wrapee in $bef_wrap; do
  name=_wrapped-"$wrapee"
  eval "$name() {
    zle set-mark-command
    zle $wrapee
  }"
  zle -N $name
done

aft_wrap=(
  vi-forward-char
  end-of-line
  beginning-of-line
  beginning-of-buffer-or-history
  down-line-or-history
  up-line-or-history
  vi-backward-char
)

for wrapee in $aft_wrap; do
  name=_wrapped-"$wrapee"
  eval "$name() {
    zle $wrapee
    zle set-mark-command
  }"
  zle -N $name
done

_hx-cmd-mode() {
  zle -K hxcmd
}

zle -N _hx-cmd-mode 


_hx-vis-mode() {
  zle -K hxvis
}


zle -N _hx-vis-mode 

test() {
  echo "\n"
  echo 1 $BUFFER
  echo 2 $MARK
  echo 3 $CURSOR
  echo 4 $REGION_ACTIVE
  echo 5 $region_highlight
  echo 6 $region
}


zle -N test 
