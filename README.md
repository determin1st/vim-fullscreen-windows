[![FullScreen](https://raw.githack.com/determin1st/vim-fullscreen-windows/master/logo.png)](https://youtu.be/ER5JYFKkYDg)

# about

this is a vim plugin that allows
to maximize gvim editor window and
also span it full screen with these functions:

- `ToggleMaximize()` maximizes window or gets back to normal
- `ToggleFullScreen()` gets in and out of fullscreen







This is an assembly, all original files included.

# Requirements

- [Windows OS](https://youtu.be/rRm0NDo1CiY) (`win7/2008r2` tested)
- [gvim](https://vi.stackexchange.com/questions/2455/what-additional-features-do-gvim-and-or-macvim-offer-compared-to-vim-inside-a-te) (graphical, non-console)

# Install

Natively, you may clone this repo:
```bash
git clone https://github.com/determin1st/vim-fullscreen-windows
```
into your [`vimfiles`](https://stackoverflow.com/questions/37630062/two-vimfiles-directories-where-do-i-install-my-plugins),
it will be either:
- **`vimfiles/pack/w/start/`**`vim-fullscreen-windows` (the new way, "w" is for windows group)
- **`vimfiles/plugin/`**`vim-fullscreen-windows` (the old way)

Also, if you have some [plugin manager](https://github.com/junegunn/vim-plug) -
it should do the job.

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



