nnoremap <silent> <Plug>(helper-gitgutter-toggle-preview) :<C-u>call helper#gitgutter#toggle_preview()<CR>

nnoremap <silent> <Plug>(close-buffer-keep-layout) :<C-u>call helper#layout#CloseBufferInTab(tabpagenr(), bufnr(''))<CR>

command! NextBuffer
      \ call helper#buffer#NextBuffer()

command! PrevBuffer
      \ call helper#buffer#PreviousBuffer()

command! WindowSwapLeft
      \ call helper#window#SwapTo('h')

command! WindowSwapDown
      \ call helper#window#SwapTo('j')

command! WindowSwapUp
      \ call helper#window#SwapTo('k')

command! WindowSwapRight
      \ call helper#window#SwapTo('l')

command! ToggleZoomWindow
      \ call helper#window#ToggleZoom()

command! RenameTabLabel
      \ call helper#ctrlspace#RenameTabLabelPrompt()

command! LoadWorkspace
      \ call helper#ctrlspace#LoadWorkspace()

command! SaveWorkspace
      \ call helper#ctrlspace#SaveWorkspace()

command! SaveWorkspacePrompt
      \ call helper#ctrlspace#SaveWorkspacePrompt()
