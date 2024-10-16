# Zsh Helix Modes

A set of keybindings for the zsh line editor inspired by [Helix](https://helix-editor.com/)/[Kakoune](https://kakoune.org/) 

I use [Helix](https://helix-editor.com/) as my main editor and have grown accustomed to motions based around selections. Because of this the built in vi-mode felt wrong to me so I created my own simple and limited version. 
Basically I use the vi keybindings but position the marker before movements so that there is always a selection that can be used in the yank/paste/delete/etc operations. 

I think it's perfectly usable right now, but there a lot more that can be added. I would like to add surround adding/replacing/etc (m_ in helix), searching the line, multiple cursors if possible and maybe even a go to word mode (gw in helix) in the future, but we'll have to see. 

It's not the cleanest code, as 1, I am quite new to zsh, and 2, there are a lot of hacks to get things working, mostly because I could not figure out how the built in visual mode manages to have selections that include the cursor. 

Feedback/tips/improvements are definitely appreciated.

## Install
I don't use a plugin manager or anything like that but you can use this by cloning the repo somewhere (for me it's in my `ZDOTDIR`) and then source the `helix-mode.zsh` file inside your `.zshrc` file.

By default ' f' in command and visual modes is set to open the terminal file manager [yazi](https://yazi-rs.github.io/), but this can be changed by setting the variable `$FILE_MANAGER` before sourcing `helix-mode.zsh`.

Note: this script also changes the cursor to be a block in the hx/vi normal modes and a line in the insert modes.

## Modes/Keybindings
Sourcing helix-mode.zsh adds the following 3 modes:
- hxins: A copy of the built in emacs mode with escape rebound to enter command mode
- hxcmd: The normal/command mode
- hxvis: The visual mode

All other keymaps are left unaffected, so at any time you can switch back by using `bindkey -v`

For the keybindings you can look at the keybinds directory or you can run the command `bindkey -M [MODE]` to see the keybindings for that specific mode.

Since this is replaces the interaction with the command line I liked keeping the emacs shortcuts in insert mode. You can change this in the [helix-mode.zsh](https://github.com/allomanta/zsh-helix-mode/blob/main/helix-mode.zsh) file by replacing `emacs` with `viins` after `hxins`.
