# Customize to your needs...
# avoid duplicates in PATH, add stuff
# XXX: symlink everything to ~/bin?
typeset -U path
path=($HOME/Tools/elixir/bin:$HOME/bin:$HOME/Tools/sbt/bin:$HOME/.luarocks/bin:$HOME/.local/bin "$path[@]")

export VIRTUALENVWRAPPER_PYTHON=$(which python3)
export WORKON_HOME=$HOME/.virtualenvs

source $HOME/.antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle bundler 
antigen bundle cake 
# antigen bundle cap 
antigen bundle coffee 
antigen bundle debian 
antigen bundle docker 
antigen bundle extract 
antigen bundle fabric 
antigen bundle gem 
# antigen bundle gibo 
antigen bundle git 
antigen bundle github history-substring-search 
antigen bundle npm per-directory-history 
antigen bundle pip 
antigen bundle rails redis-cli 
antigen bundle rvm 
antigen bundle sbt 
antigen bundle scala 
antigen bundle screen ssh-agent 
antigen bundle sublime 
antigen bundle tmux 
antigen bundle virtualenvwrapper
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle sindresorhus/pure

antigen bundle simonwhitaker/gibo gibo-completion.zsh

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

antigen apply

# ZSH_TMUX_AUTOSTART=true

export WORKON_HOME=$HOME/.venvs


source /home/itsbth/.nvm/nvm.sh
export NODE_PATH=$(npm config get prefix)/lib/node_modules

export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64/

# $+commands[subl] && export EDITOR='subl -w'
export EDITOR=vim

if ! [[ $LUA_PATH =~ luarocks ]]; then
  export LUA_PATH="$HOME/.luarocks/share/lua/5.2/?.lua;$(lua -e 'print(package.path)')"
  export LUA_CPATH="$HOME/.luarocks/lib/lua/5.2/?.so;$(lua -e 'print(package.path)')"
fi

# Why? Why not? :-)
alias fucking=sudo
alias :q=exit
unalias ag # :/
path+="$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Who stole this?
