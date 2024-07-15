" execute once
if exists("g:gvim_maximize")
  finish
endif
if has("gui_running")
  if has("win64")
    let g:gvim_maximize = 4
  elseif has("win32")
    let g:gvim_maximize = 2
  else
    let g:gvim_maximize = 1
  endif
else
  let g:gvim_maximize = 1
endif
" determine paths to dlls (must be in the same folder)
let s:maximize_32 = expand('<sfile>:p:h').'/gvim-maximize-32.dll'
let s:maximize_64 = expand('<sfile>:p:h').'/gvim-maximize-64.dll'
let s:maximized   = 0
" expose toggle functions
function! g:ToggleFullScreen()
  if g:gvim_maximize == 4
    call libcallnr(s:maximize_64, 'toggle_full_screen', 0)
  elseif g:gvim_maximize == 2
    call libcallnr(s:maximize_32, 'toggle_full_screen', 0)
  endif
endfunction
function! g:ToggleMaximize()
  if g:gvim_maximize > 1
    if s:maximized
      let s:maximized = 0
    else
      let s:maximized = 1
    endif
    if g:gvim_maximize == 4
      call libcallnr(s:maximize_64, 'maximize', s:maximized)
    elseif g:gvim_maximize == 2
      call libcallnr(s:maximize_32, 'maximize', s:maximized)
    endif
  endif
endfunction
