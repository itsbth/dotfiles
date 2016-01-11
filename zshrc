# -*- mode: sh; -*-
# Customize to your needs...
# avoid duplicates in PATH, add stuff
# XXX: symlink everything to ~/bin?
typeset -U path
path=($HOME/go/bin $HOME/.local/bin "$path[@]")

export VIRTUALENVWRAPPER_PYTHON=$(which python3)
export WORKON_HOME=$HOME/.virtualenvs

source $HOME/.antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundles <<EOBUNDLES
  adb
  autojump
  autopep8
  aws
  battery
  bgnotify
  bower
  bundler
  cabal
  cake
  catimg
  coffee
  colored-man-pages
  debian
  django
  docker-compose
  docker
  emacs
  extract
  fabric
  gem
  git
  github
  golang
  history-substring-search
  lein
  mix-fast
  npm
  nvm
  pip
  postgres
  pyenv
  rails
  redis-cli
  rvm
  # safe-paste
  sbt
  scala
  screen
  stack
  sublime
  sudo
  tmux

  zsh-users/zsh-syntax-highlighting

  mafredri/zsh-async
  sindresorhus/pure

  simonwhitaker/gibo gibo-completion.zsh
  djui/alias-tips

  tarruda/zsh-autosuggestions
  supercrabtree/k
EOBUNDLES

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

antigen apply

# zle-line-init() {
#     zle autosuggest-start
# }

# zle -N zle-line-init

# ZSH_TMUX_AUTOSTART=true

export $(gnome-keyring-daemon --start)

export WORKON_HOME=$HOME/.venvs

source /home/itsbth/.nvm/nvm.sh
export NODE_PATH=$(npm config get prefix)/lib/node_modules

export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64/

# $+commands[subl] && export EDITOR='subl -w'
export EDITOR='emacsclient -t'

# if ! [[ $LUA_PATH =~ luarocks ]]; then
#   export LUA_PATH="$HOME/.luarocks/share/lua/5.2/?.lua;$(lua -e 'print(package.path)')"
#   export LUA_CPATH="$HOME/.luarocks/lib/lua/5.2/?.so;$(lua -e 'print(package.cpath)')"
# fi

# Why? Why not? :-)
alias fucking=sudo
alias :q=exit
unalias ag # :/

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Who stole this?

[ -s "/home/itsbth/.dnx/dnvm/dnvm.sh" ] && . "/home/itsbth/.dnx/dnvm/dnvm.sh" # Load dnvm

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

if [[ -d "$HOME/.pyenv/" ]]; then
    path=($HOME/.pyenv/bin "$path[@]")
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

[ -s $HOME/go ] && export GOPATH=$HOME/go
[ -s $HOME/Code/rust ] && export RUST_SRC_PATH=$HOME/Code/rust
