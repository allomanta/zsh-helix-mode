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
