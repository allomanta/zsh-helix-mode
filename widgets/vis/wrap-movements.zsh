_wrap=(
  end-of-line
  vi-backward-blank-word
  vi-forward-blank-word-end
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

for wrapee in $_wrap; do
  name="_vis-$(echo $wrapee | sed 's/vi-//g')"
  eval "$name() {
    zle ."$wrapee"
  }"
  zle -N $name
done
