if has('mouse')
  set mouse=a
endif


runtime plugins.vim

if exists('loaded_startify') 
  runtime plugins/startify.vim
endif
if exists('loaded_lightbar')
  runtime lightbar.vim
endif
if exists('loaded_coc')
  runtime plugin/coc.vim
endif
if exists('loaded_clap') 
  runtime plugins/clap.vim
endif
if exists('loaded_deoplete') 
  runtime plugins/deoplete.vim
endif

runtime hotkeys.vim

runtime rust.vim

" plug#begin " topgrade vim-plug heuristic is bad
