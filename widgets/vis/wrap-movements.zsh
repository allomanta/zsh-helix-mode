() {
  local wrapee name
  local -a wrap=(
    end-of-line
    vi-backward-blank-word
    vi-backward-word
    beginning-of-line
    vi-forward-char
    vi-forward-word-end
    end-of-line
    beginning-of-buffer-or-history
    end-of-buffer-or-history
    down-line-or-history
    up-line-or-history
    vi-first-non-blank
  )

  for wrapee in $wrap; do
    name="_vis-${wrapee//vi-/}"
    eval "$name() {
      zle ."$wrapee"
    }"
    zle -N $name
  done
}
