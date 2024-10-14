_wrap=(
  end-of-line
  beginning-of-line
  end-of-line
  beginning-of-buffer-or-history
  end-of-buffer-or-history
  down-line-or-history
  up-line-or-history
  vi-backward-char
  vi-first-non-blank
)

for wrapee in $_wrap; do
  name="_hx-$(echo $wrapee | sed 's/vi-//g')"
  eval "$name() {
    zle ."$wrapee"
    zle .set-mark-command
  }"
  zle -N $name
done

_hx-insert() {
  if [[ $MARK -lt $CURSOR ]]; then
    zle exchange-point-and-mark
  fi
  zle .vi-insert
}
zle -N _hx-insert

_hx-add-next() {
  if [[ $MARK -gt $CURSOR ]]; then
    zle exchange-point-and-mark
    (( --CURSOR ))
  fi
  zle .vi-add-next
}
zle -N _hx-add-next

_hx-forward-char() {
  zle vi-forward-char
  zle .set-mark-command
}
zle -N _hx-forward-char

_hx-forward-word() {
  zle .set-mark-command
  zle .vi-forward-word
  ((--CURSOR))
}
zle -N _hx-forward-word

_hx-forward-blank-word() {
  zle .set-mark-command
  zle .vi-forward-blank-word
  ((--CURSOR))
}
zle -N _hx-forward-blank-word


_hx-forward-word-end() {
  zle .set-mark-command
  zle .vi-forward-word-end
}
zle -N _hx-forward-word-end

_hx-forward-blank-word-end() {
  zle .set-mark-command
  zle .vi-forward-blank-word-end
}
zle -N _hx-forward-blank-word-end

_hx-backward-word() {
  ((++CURSOR))
  zle .set-mark-command
  ((--CURSOR))
  zle .vi-backward-word
}
zle -N _hx-backward-word

_hx-backward-blank-word() {
  ((++CURSOR))
  zle .set-mark-command
  ((--CURSOR))
  zle .vi-backward-blank-word
}
zle -N _hx-backward-blank-word

_hx-yank() {
  if [[ $MARK -le $CURSOR ]]; then
    ((++CURSOR))
    zle .copy-region-as-kill
    ((--CURSOR))
  else
    zle .copy-region-as-kill
  fi
}
zle -N _hx-yank

_hx-yank-to-clipboard() {
  if [[ $MARK -le $CURSOR ]]; then
    wl-copy <<< ${BUFFER:$MARK:$((CURSOR-MARK+1))}
  else
    echo huh ${BUFFER:$CURSOR:$((CURSOR-MARK+1))}
    wl-copy <<< ${BUFFER:$CURSOR:((MARK-CURSOR+1))}
  fi
}
zle -N _hx-yank-to-clipboard

_hx-paste() {
  zle .vi-put-after
  (( --CURSOR ))
}
zle -N _hx-paste

_hx-paste-replace-selection() {
  if [[ $MARK -le $CURSOR ]]; then
    ((++CURSOR))
    zle .put-replace-selection
    ((--CURSOR))
  else
    zle .put-replace-selection
  fi
}
zle -N _hx-paste-replace-selection

_hx-paste-from-clipboard() {
  local text=$(wl-paste)
  if [[ $MARK -le $CURSOR ]]; then
    ((++CURSOR))
    LBUFFER+=$text
    ((--CURSOR))
  else
    BUFFER=${BUFFER:0:$MARK}$text${BUFFER:$MARK}
    MARK+=${#text}
  fi
}
zle -N _hx-paste-from-clipboard

_hx-paste-before-from-clipboard() {
  local text=$(wl-paste)
  if [[ $MARK -le $CURSOR ]]; then
    BUFFER=${BUFFER:0:$MARK}$text${BUFFER:$MARK}
    CURSOR=$CURSOR+${#text}
  else
    BUFFER=${BUFFER:0:$CURSOR}$text${BUFFER:$CURSOR}
    MARK=$MARK+${#text}
  fi
}
zle -N _hx-paste-before-from-clipboard

_hx-delete() {
  if [[ $MARK -le $CURSOR ]]; then
    ((++CURSOR))
    zle .kill-region
    ((--CURSOR))
  else
    zle .kill-region
  fi
}
zle -N _hx-delete

_hx-change() {
  if [[ $MARK -le $CURSOR ]]; then
    ((++CURSOR))
    zle .kill-region
    ((--CURSOR))
    zle .vi-insert
  else
    zle .vi-change
  fi
}
zle -N _hx-change

_hx-select-line() {
  MARK=0
  zle .end-of-line
}
zle -N _hx-select-line 

_hx-unselect() {
  MARK=$CURSOR
}
zle -N _hx-unselect 

_hx-cmd-mode() {
  zle -K hxcmd
}
zle -N _hx-cmd-mode 

_hx-vis-mode() {
  zle -K hxvis
}
zle -N _hx-vis-mode 

