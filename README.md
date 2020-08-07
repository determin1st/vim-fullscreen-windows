[![FullScreen](https://raw.githack.com/determin1st/vim-fullscreen/master/logo.png)](https://youtu.be/ER5JYFKkYDg)

# About

A super-simple vim plugin script and two compiled dlls
which expose two global functions:

- ToggleFullScreen() to toggle fullscreen mode for gvim
- ToggleMaximize() to maximize window or bring it back to normal

This is an assembly, all original files included.

# Requirements

- [Windows OS](https://youtu.be/rRm0NDo1CiY) (`win7/2008r2` tested)
- [gvim](https://vi.stackexchange.com/questions/2455/what-additional-features-do-gvim-and-or-macvim-offer-compared-to-vim-inside-a-te) (graphical, non-console)

# Install

You may clone this repo `https://github.com/determin1st/vim-fullscreen-windows`
into your `vimfiles/pack/win/start` or in `vimfiles/plugin`

# Usage

To get maximum from both functions, put a config:
```vim

" vim-fullscreen-windows plugin
" to maximize gvim on startup
autocmd GUIEnter * call ToggleMaximize()
" set hotkey for fullscreen
nnoremap <F9> :call ToggleFullScreen()<CR>

```
..into your [`_vimrc`](https://stackoverflow.com/questions/10921441/where-is-my-vimrc-file) file.

# Links

https://www.vim.org/scripts/script.php?script_id=2596

https://www.vim.org/scripts/script.php?script_id=1302



