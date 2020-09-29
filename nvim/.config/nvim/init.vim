if has('mouse')
  set mouse=a
endif


runtime plugins.vim

if has_key(g:plugs, 'vim-startify')
  runtime plugins/startify.vim
endif
if has_key(g:plugs, 'lightline.vim')
  runtime plugins/lightline.vim
endif
if has_key(g:plugs, 'vim-airline')
  runtime plugins/airline.vim
endif
if has_key(g:plugs, 'coc.nvim')
  runtime plugin/coc.vim
endif
if has_key(g:plugs, 'vim-clap')
  runtime plugins/clap.vim
endif
if has_key(g:plugs, 'deoplete-nvim')
  runtime plugins/deoplete.vim
endif

runtime hotkeys.vim

runtime rust.vim

" plug#begin " topgrade vim-plug heuristic is bad
