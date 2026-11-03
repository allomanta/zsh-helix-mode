_hx-clipboard-copy() {
  if [[ -n $HX_CLIPBOARD_COPY ]]; then
    eval "$HX_CLIPBOARD_COPY" >/dev/null 2>&1 ||
      zle -M "Clipboard copy failed: $HX_CLIPBOARD_COPY"
  elif [[ -n $TMUX ]] && (( $+commands[tmux] )); then
    tmux load-buffer -w - >/dev/null 2>&1
  else
    printf '\e]52;c;%s\a' "$(base64 | tr -d '\n')" > /dev/tty
  fi
}

_hx-clipboard-paste() {
  if [[ -n $HX_CLIPBOARD_PASTE ]]; then
    REPLY=$(eval "$HX_CLIPBOARD_PASTE" 2>/dev/null) || {
      zle -M "Clipboard paste failed: $HX_CLIPBOARD_PASTE"
      return 1
    }
  elif [[ -n $TMUX ]] && (( $+commands[tmux] )); then
    REPLY=$(tmux save-buffer - 2>/dev/null)
  else
    zle -M "Set HX_CLIPBOARD_PASTE to paste from the clipboard"
    return 1
  fi
}
