# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(
  bundler cake cap coffee debian docker extract fabric gem gibo git github
  history-substring-search npm per-directory-history pip rails redis-cli rvm
  sbt scala screen sublime tmux zsh-syntax-highlighting
)

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

ZSH_TMUX_AUTOSTART=true

export WORKON_HOME=$HOME/.venvs

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
# avoid duplicates in PATH, add stuff
# XXX: symlink everything to ~/bin?
typeset -U path
path=($HOME/Tools/elixir/bin:$HOME/bin:$HOME/Tools/sbt/bin:$HOME/.luarocks/bin:$HOME/.local/bin "$path[@]")

source /home/itsbth/.nvm/nvm.sh
export NODE_PATH=$(npm config get prefix)/lib/node_modules

export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64/

# $+commands[subl] && export EDITOR='subl -w'
export EDITOR=vim

# Why? Why not? :-)
alias fucking=sudo
alias :q=exit
unalias ag # :/
path+="$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Who stole this?
