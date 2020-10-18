if has_key(g:plugs, 'vim-clap')
  noremap <C-P> :Clap files<CR>
endif

if has_key(g:plugs, 'vim-bufmru')
  " Ctrl-Tab and Ctrl-Shift-Tab in normal mode to navigate buffers
  map <Space><Tab> :BufMRUNext<CR>
  map <Space><S-Tab> :BufMRUPrev<CR>
endif

" lsp
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
