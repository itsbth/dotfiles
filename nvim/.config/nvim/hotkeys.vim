if has_key(g:plugs, 'vim-clap')
  noremap <C-P> :Clap files<CR>
endif

if has_key(g:plugs, 'vim-bufmru')
  " Ctrl-Tab and Ctrl-Shift-Tab in normal mode to navigate buffers
  map <Space><Tab> :BufMRUNext<CR>
  map <Space><S-Tab> :BufMRUPrev<CR>
endif
