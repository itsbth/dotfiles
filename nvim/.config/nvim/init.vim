if has('mouse')
  set mouse=a
endif


runtime plugins.vim

if exists('loaded_startify') 
  runtime startify.vim
endif
" runtime lightbar.vim
" runtime plugin/coc.vim
if exists('loaded_clap') 
  runtime plugin/clap.vim
endif
if exists('loaded_deoplete') 
  runtime plugin/deoplete.vim
endif

runtime hotkeys.vim

runtime rust.vim

" plug#begin " topgrade vim-plug heuristic is bad
