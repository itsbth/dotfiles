" setup rust_analyzer LSP (IDE features)
lua require'nvim_lsp'.rust_analyzer.setup{}

" Use LSP omni-completion in Rust files
augroup conf_rust
  autocmd!
  autocmd Filetype rust setlocal omnifunc=v:lua.vim.lsp.omnifunc
augroup END

" Enable deoplete autocompletion in Rust files
let g:deoplete#enable_at_startup = 1
