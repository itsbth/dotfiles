# Customize to your needs...
# avoid duplicates in PATH, add stuff
# XXX: symlink everything to ~/bin?
typeset -U path
path=($HOME/Tools/elixir/bin:$HOME/bin:$HOME/Tools/sbt/bin:$HOME/.luarocks/bin:$HOME/.local/bin "$path[@]")

export VIRTUALENVWRAPPER_PYTHON=$(which python3)
export WORKON_HOME=$HOME/.virtualenvs

source $HOME/.antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundles <<EOBUNDLES
	autojump
  bgnotify
  bower
	bundler
  cabal
	cake
	coffee
	debian
	docker
	extract
	fabric
	gem
	git
	github
  history-substring-search
	npm
  per-directory-history
	pip
	rails
  redis-cli
	rvm
	sbt
	scala
	screen
	sublime
	tmux
	virtualenvwrapper

	zsh-users/zsh-syntax-highlighting
	sindresorhus/pure

	simonwhitaker/gibo gibo-completion.zsh
EOBUNDLES

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

antigen apply

# ZSH_TMUX_AUTOSTART=true

export $(gnome-keyring-daemon --start)

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

[ -s "/home/itsbth/.dnx/dnvm/dnvm.sh" ] && . "/home/itsbth/.dnx/dnvm/dnvm.sh" # Load dnvm
