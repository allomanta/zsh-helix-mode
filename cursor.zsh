function _hx-cursor-keymap-select {
    # See https://ttssh2.osdn.jp/manual/4/en/usage/tips/vim.html for cursor shapes
    local cursor_block='\e[2 q'
    local cursor_beam='\e[6 q'
    if [[ ${KEYMAP} == vicmd ]] ||
        [[ ${KEYMAP} == hxcmd ]] ||
        [[ $1 = 'block' ]]; then
        echo -ne $cursor_block
    elif [[ ${KEYMAP} == main ]] ||
        [[ ${KEYMAP} == viins ]] ||
        [[ ${KEYMAP} = '' ]] ||
        [[ $1 = 'beam' ]]; then
        echo -ne $cursor_beam
    fi
}

_hx-cursor-line-init() {
    local cursor_beam='\e[6 q'
    echo -ne $cursor_beam
}

autoload -Uz add-zle-hook-widget
zle -N _hx-cursor-keymap-select
zle -N _hx-cursor-line-init
add-zle-hook-widget keymap-select _hx-cursor-keymap-select
add-zle-hook-widget line-init _hx-cursor-line-init
