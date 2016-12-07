# -*- mode: sh; -*-
# Customize to your needs...
# avoid duplicates in PATH, add stuff
# XXX: symlink everything to ~/bin?
typeset -U path
path=($HOME/.local/bin "$path[@]")

export VIRTUALENVWRAPPER_PYTHON=$(which python3)
export WORKON_HOME=$HOME/.virtualenvs

source $HOME/.zplug/init.zsh

zplug "plugins/adb", from:oh-my-zsh
zplug "plugins/autojump", from:oh-my-zsh
zplug "plugins/autopep8", from:oh-my-zsh
# zplug "plugins/aws", from:oh-my-zsh
zplug "plugins/battery", from:oh-my-zsh
zplug "plugins/bgnotify", from:oh-my-zsh
zplug "plugins/bower", from:oh-my-zsh
zplug "plugins/bundler", from:oh-my-zsh
zplug "plugins/cabal", from:oh-my-zsh
zplug "plugins/cake", from:oh-my-zsh
zplug "plugins/catimg", from:oh-my-zsh
zplug "plugins/coffee", from:oh-my-zsh
zplug "plugins/colored-man-pages", from:oh-my-zsh
zplug "plugins/debian", from:oh-my-zsh
zplug "plugins/django", from:oh-my-zsh
zplug "plugins/docker-compose", from:oh-my-zsh
zplug "plugins/docker", from:oh-my-zsh
zplug "plugins/emacs", from:oh-my-zsh
zplug "plugins/extract", from:oh-my-zsh
zplug "plugins/fabric", from:oh-my-zsh
zplug "plugins/gem", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/github", from:oh-my-zsh
zplug "plugins/golang", from:oh-my-zsh
zplug "plugins/history-substring-search", from:oh-my-zsh
zplug "plugins/lein", from:oh-my-zsh
zplug "plugins/mix-fast", from:oh-my-zsh
zplug "plugins/npm", from:oh-my-zsh
zplug "plugins/nvm", from:oh-my-zsh
zplug "plugins/pip", from:oh-my-zsh
zplug "plugins/postgres", from:oh-my-zsh
zplug "plugins/pyenv", from:oh-my-zsh
zplug "plugins/rails", from:oh-my-zsh
zplug "plugins/redis-cli", from:oh-my-zsh
zplug "plugins/rvm", from:oh-my-zsh
# zplug "plugins/safe-paste", from:oh-my-zsh
zplug "plugins/sbt", from:oh-my-zsh
zplug "plugins/scala", from:oh-my-zsh
zplug "plugins/screen", from:oh-my-zsh
zplug "plugins/stack", from:oh-my-zsh
zplug "plugins/sublime", from:oh-my-zsh
zplug "plugins/sudo", from:oh-my-zsh
zplug "plugins/tmux", from:oh-my-zsh

zplug "zsh-users/zsh-syntax-highlighting", nice:10

zplug "mafredri/zsh-async"
zplug "sindresorhus/pure"

zplug "simonwhitaker/gibo", use:gibo-completion.zsh
zplug "djui/alias-tips"

zplug "supercrabtree/k"

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# antigen apply
zplug load

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
export ANDROID_HOME=$HOME/Android/Sdk

# $+commands[subl] && export EDITOR='subl -w'
export EDITOR='emacsclient -t'

# if ! [[ $LUA_PATH =~ luarocks ]]; then
#   export LUA_PATH="$HOME/.luarocks/share/lua/5.2/?.lua;$(lua -e 'print(package.path)')"
#   export LUA_CPATH="$HOME/.luarocks/lib/lua/5.2/?.so;$(lua -e 'print(package.cpath)')"
# fi

gsize() {
    for f in "$@"; do
        local before=$(wc -c < $f)
        local after=$(gzip -c $f | wc -c)
        local percentage=$(bc <<< "scale=2; ($after * 100 / $before)")
        echo "$f: $before -> $after ($percentage%)"
    done
}

# Why? Why not? :-)
alias fucking=sudo
alias :q=exit
alias :e=e
alias fig=docker-compose

unalias ag # :/
compdef -d ag

[ -s "/home/itsbth/.dnx/dnvm/dnvm.sh" ] && . "/home/itsbth/.dnx/dnvm/dnvm.sh" # Load dnvm

if [[ -d "$HOME/.pyenv/" ]]; then
    path=($HOME/.pyenv/bin "$path[@]")
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

[ -s $HOME/Code/Go ] && export GOPATH=$HOME/Code/Go
[ -s $HOME/Code/rust ] && export RUST_SRC_PATH=$HOME/Code/rust/src
eval $(thefuck --alias)
