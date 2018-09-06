# -*- mode: sh; -*-
# Customize to your needs...
# avoid duplicates in PATH, add stuff
typeset -U path
# XXX: symlink everything to ~/bin?
path=($HOME/.local/bin "$path[@]")
fpath+=$HOME/.zfunc

export VIRTUALENVWRAPPER_PYTHON=$(which python3)
export WORKON_HOME=$HOME/.local/.venvs

source $HOME/.zplug/init.zsh
# zplug 'zplug/zplug', hook-build:'zplug --self-manage'

zplug "lib/*", from:oh-my-zsh

zplug "plugins/adb", from:oh-my-zsh
zplug "plugins/autojump", from:oh-my-zsh
zplug "plugins/autopep8", from:oh-my-zsh
# zplug "plugins/aws", from:oh-my-zsh
zplug "plugins/battery", from:oh-my-zsh
zplug "plugins/bgnotify", from:oh-my-zsh
# zplug "plugins/bower", from:oh-my-zsh
zplug "plugins/bundler", from:oh-my-zsh
# zplug "plugins/cabal", from:oh-my-zsh
# zplug "plugins/cake", from:oh-my-zsh
zplug "plugins/catimg", from:oh-my-zsh
# zplug "plugins/coffee", from:oh-my-zsh
zplug "plugins/colored-man-pages", from:oh-my-zsh
zplug "plugins/debian", from:oh-my-zsh
zplug "plugins/django", from:oh-my-zsh
zplug "plugins/docker-compose", from:oh-my-zsh
zplug "plugins/docker", from:oh-my-zsh
zplug "plugins/emacs", from:oh-my-zsh
zplug "plugins/extract", from:oh-my-zsh
# zplug "plugins/fabric", from:oh-my-zsh
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
# zplug "plugins/rails", from:oh-my-zsh
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
zplug "plugins/yarn", from:oh-my-zsh

zplug "zsh-users/zsh-syntax-highlighting", defer:2

zplug "mafredri/zsh-async"
zplug "sindresorhus/pure", defer:1
# zplug denysdovhan/spaceship-zsh-theme, use:spaceship.zsh, from:github, as:theme

zplug "simonwhitaker/gibo", use:"/", hook-build:"ln -s gibo-completion.zsh _gibo"
zplug "djui/alias-tips"

zplug "supercrabtree/k"
zplug "rupa/z", use:z.sh

# zplug "technomancy/leiningen", as:command, at:stable, use:bin/lein
zplug "github/hub", from:gh-r, as:command
zplug "junegunn/fzf-bin", from:gh-r, as:command, rename-to:fzf
zplug "junegunn/fzf", as:command, use:bin/fzf-tmux

zplug "larkery/zsh-histdb", use:"*.zsh"
# zplug "zsh-users/zsh-autosuggestions" # broken :( [20171109: still broken]

zplug "b4b4r07/enhancd", use:init.sh
zplug "b4b4r07/emoji-cli"

if ! zplug check; then
    zplug install
fi

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)


ENHANCD_DISABLE_DOT=1

# XXX: Ugly hack
# export ZSH=$HOME/.zplug/repos/robbyrussell/oh-my-zsh
zplug load

# START histdb / autosuggest
add-zsh-hook preexec _start_timer
add-zsh-hook precmd  _stop_timer

_zsh_autosuggest_strategy_histdb_top_here() {
    local query="select commands.argv from
history left join commands on history.command_id = commands.rowid
left join places on history.place_id = places.rowid
where places.dir LIKE '$(sql_escape $PWD)%'
and commands.argv LIKE '$(sql_escape $1)%'
group by commands.argv order by count(*) desc limit 1"
    _histdb_query "$query"
}

ZSH_AUTOSUGGEST_STRATEGY=histdb_top_here

# END histdb / autosuggest

# ZSH_TMUX_AUTOSTART=true

export $(gnome-keyring-daemon --start)

eval "$($HOME/.pyenv/bin/pyenv init - zsh)"

export WORKON_HOME=$HOME/.venvs

# source /home/itsbth/.nvm/nvm.sh
# export NODE_PATH=$(npm config get prefix)/lib/node_modules
# Defer initialization of nvm until nvm, node or a node-dependent command is
# run. Ensure this block is only run once if .bashrc gets sourced multiple times
# by checking whether __init_nvm is a function.
if [ -s "$HOME/.nvm/nvm.sh" ] && [ ! "$(whence -w __init_nvm)" = function ]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
  declare -a __node_commands=('nvm' 'node' 'npm' 'yarn' 'npx')
  function __init_nvm() {
    for i in "${__node_commands[@]}"; do unalias $i; done
    . "$NVM_DIR"/nvm.sh
    unset __node_commands
    unset -f __init_nvm
  }
  for i in "${__node_commands[@]}"; do alias $i='__init_nvm && '$i; done
fi

export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/
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

cheat.sh() {
  curl "cheat.sh/$(echo "$@" | tr ' ' '/')"
}

# Why? Why not? :-)
alias fucking=sudo
alias :q=exit
alias :e=e
alias fig=docker-compose
alias snek=python3
alias h='highlight -O truecolor' # / ansi / xterm256
alias p=playerctl
alias pp='playerctl play-pause'

alias gs='echo "Assuming you meant git status." && git status'

# unalias ag # :/
compdef -d ag

# fix gibo completion
compdef _gibo gibo

export FZF_DEFAULT_COMMAND='rg --files'

[ -s $HOME/Code/Go ] && export GOPATH=$HOME/Code/Go && path+=$GOPATH/bin
[ -s $HOME/Tools/go ] && export GOROOT=$HOME/Tools/go
[ -s $HOME/Code/rust ] && export RUST_SRC_PATH=$HOME/Code/rust/src
# TODO: ~~~fix alias to use correct python version~~~
# pipsi the the rescue
eval $(thefuck --alias)

path=("$HOME/.yarn/bin" "$path[@]")

# PATH="/home/itsbth/perl5/bin${PATH:+:${PATH}}"; export PATH;
# PERL5LIB="/home/itsbth/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
# PERL_LOCAL_LIB_ROOT="/home/itsbth/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
# PERL_MB_OPT="--install_base \"/home/itsbth/perl5\""; export PERL_MB_OPT;
# PERL_MM_OPT="INSTALL_BASE=/home/itsbth/perl5"; export PERL_MM_OPT;

autoload -U +X bashcompinit && bashcompinit
complete -C /home/itsbth/bin/vault vault

# OPAM configuration
. /home/itsbth/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
