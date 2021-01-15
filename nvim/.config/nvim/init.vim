if has('mouse')
  set mouse=a
endif

" make python work in venvs
let g:python3_host_prog = '/usr/bin/python3'

" probably a safe assumption
set termguicolors

runtime plugins.vim

" colorscheme 1989
colorscheme base16-gruvbox-dark-pale

if has_key(g:plugs, 'vim-startify')
  runtime plugins/startify.vim
endif
if has_key(g:plugs, 'lightline.vim')
  runtime plugins/lightline.vim
endif
if has_key(g:plugs, 'coc.nvim')
  runtime plugins/coc.vim
endif
if has_key(g:plugs, 'LanguageClient-neovim')
  runtime plugins/languageclient.vim
endif
if has_key(g:plugs, 'vim-clap')
  runtime plugins/clap.vim
endif
if has_key(g:plugs, 'deoplete.nvim')
  runtime plugins/deoplete.vim
endif

runtime hotkeys.vim

runtime rust.vim
runtime go.vim

lua require('aniseed.env').init()

" plug#begin " topgrade vim-plug heuristic is bad
