() {
  local wrapee name
  local -a wrap=(
    end-of-line
    beginning-of-line
    end-of-line
    beginning-of-buffer-or-history
    end-of-buffer-or-history
    down-line-or-history
    up-line-or-history
    vi-backward-char
    vi-first-non-blank
    vi-open-line-below
    vi-open-line-above
    vi-indent
    vi-unindent
  )

  for wrapee in $wrap; do
    name="_hx-${wrapee//vi-/}"
    eval "$name() {
      zle ."$wrapee"
      zle .set-mark-command
    }"
    zle -N $name
  done
}
