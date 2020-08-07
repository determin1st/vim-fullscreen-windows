" execute once
if exists("g:vim_fullscreen")
  finish
endif
let g:vim_fullscreen = 1
" determine paths to dlls (must be in the same folder)
let s:fullscreen_dll = expand('<sfile>:p:h').'/gvimfullscreen.dll'
let s:maximize_dll   = expand('<sfile>:p:h').'/maximize.dll'
let s:maximized      = 1
" expose toggle functions
function! g:ToggleFullScreen()
  call libcallnr(s:fullscreen_dll, 'ToggleFullScreen', 0)
endfunction
function! g:ToggleMaximize()
  call libcallnr(s:maximize_dll, 'Maximize', s:maximized)
  if s:maximized
    let s:maximized = 0
  else
    let s:maximized = 1
  endif
endfunction
