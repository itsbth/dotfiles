if [[ -n "$ZSH_PROFILE_ZSHRC" ]]; then
	zmodload zsh/datetime
	setopt PROMPT_SUBST
	PS4='+$EPOCHREALTIME %N:%i> '

	logfile=$(mktemp zsh_profile.XXXXXXXX)
	echo "Logging to $logfile"
	exec 3>&2 2>$logfile

	setopt XTRACE
fi

it_ts=$(($(date +%s%N)/1000000)) 
it_n=""

it_time_section() {
	# comment out me to enable perf logging
	return
	local nt=$(($(date +%s%N)/1000000))
	if [[ -n "$it_n" ]]; then
		local elapsed=$(($nt - $it_ts))
		echo "==> $it_n : $elapsed <=="
	fi
	it_n=$1	
	it_ts=$nt
}

it_time_section "load zinit module"

module_path+=( "$HOME/.zinit/bin/zmodules/Src" )
zmodload zdharma/zplugin

it_time_section "misc header"

typeset -aUx path
fpath=($HOME/.zsh $fpath)
export path=($HOME/.local/bin /snap/bin "$path[@]")
alias dotstow='stow -d $HOME/repos/github.com/itsbth/dotfiles -t $HOME'
alias lpass-fzf="lpass show -c --password \$(lpass ls  | fzf | awk '{print \$(NF)}' | sed 's/\]//g')"

take() { mkdir -p "$1" && cd "$1" }

it_time_section "nvm"

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
# export PATH="$NVM_DIR/versions/node/v$(<$NVM_DIR/alias/default)/bin:$PATH"
# default to latest version
export PATH="$NVM_DIR/versions/node/$(ls $NVM_DIR/versions/node | sort -V | tail -n1)/bin:$PATH"
alias nvm='unalias nvm; [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"; nvm $@'

it_time_section "misc"

# zstyle for prezto
zstyle ':prezto:module:terminal' auto-title 'yes'

# skip ubuntu zshrc compinit
skip_global_compinit=1

it_time_section "zinit load"

### Added by Zplugin's installer
source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zplugin's installer chunk

it_time_section "zinit start"

# zinit start

zinit light mollifier/anyframe
zinit ice wait"0" blockf
zinit light zsh-users/zsh-completions

zinit ice wait"0" atload"_zsh_autosuggest_start"
zinit light zsh-users/zsh-autosuggestions

zinit ice wait"0"
zinit light zsh-users/zsh-history-substring-search

zinit ice wait"0" atinit"zpcompinit; zpcdreplay"
zinit light zdharma/fast-syntax-highlighting


# zinit ice pick"async.zsh" src"pure.zsh"
# zinit light sindresorhus/pure

#zinit snippet OMZ::lib/git.zsh
#zinit light therealklanni/purity

zinit ice from"gh-r" bpick"*linux-amd64*" pick"hub-*/bin/hub" as"command"
zinit light 'github/hub'

zinit ice from"gh-r" as"command" mv"hivemind-* -> hivemind"
zinit light DarthSim/hivemind

zinit ice from"gh-r" as"program"
zinit light junegunn/fzf-bin

zinit ice pick"bin/fzf-tmux" as"program" multisrc"shell/{completion,key-bindings}.zsh"
zinit light junegunn/fzf

zinit ice wait"0"
zinit light molovo/tipz

zinit ice wait"0"
zinit light marzocchi/zsh-notify

zinit snippet PZT::modules/helper/init.zsh
zinit ice atload"[ -d external/ ] || git clone https://github.com/zsh-users/zsh-completions external"
zinit snippet PZT::modules/completion/init.zsh
zinit snippet PZT::modules/history/init.zsh
zinit snippet PZT::modules/environment/init.zsh
zinit snippet PZT::modules/directory/init.zsh
zinit snippet PZT::modules/terminal/init.zsh
zinit ice svn
zinit snippet PZT::modules/utility/
zinit ice svn
zinit snippet PZT::modules/git/
zinit snippet PZT::modules/gpg/init.zsh
zinit snippet PZT::modules/ssh/init.zsh
#zinit ice wait"0" blockf
#zinit snippet PZT::modules/history-substring-search/init.zsh

zinit ice from"gh-r" bpick"*linux_amd64*" pick"ghq_*/ghq" as"command"
zinit light x-motemen/ghq

zinit light zdharma/zui
zinit light zdharma/zplugin-crasis

zinit light itsbth/zsh-fzf-ghq

zinit ice depth=1
# zinit light romkatv/powerlevel10k

it_time_section "thefuck"

eval $(thefuck --alias)

it_time_section "ktheme defs"

ktheme() {
	if [ "$1" = random ]; then
		local theme="$(find $HOME/repos/github.com/dexpota/kitty-themes/ -not -path '*/\.*' -type f | shuf -n 1)"
		kitty @ set-colors -a -c "$theme"
	else
		kitty @ set-colors -a -c "$HOME/repos/github.com/dexpota/kitty-themes/themes/$1.conf"
	fi
}

_ktheme() {
	local themes=( $HOME/repos/github.com/dexpota/kitty-themes/themes/*.conf(:r:t) random )
	_values 'themes' $themes
}

compdef _ktheme ktheme

it_time_section "print splash"

# try (and fail) to detect nested shells
if [ "$(ps -p $PPID -o comm=)" != zsh ]; then
	if [[ $TERM = xterm-kitty-not && -f $HOME/Pictures/pexip-logo-hvit.svg ]]; then
		kitty +kitten icat $HOME/Pictures/pexip-logo-hvit.svg
	elif [[ $+commands[toilet] && $+commands[lolcat] ]]; then
	    toilet -f bigmono12 pexip | lolcat -t
	fi
fi

it_time_section "motd"

() {
	local motd="$1"
	local len="$(jq length $motd)"
	# not quite random, but good enough
	local rand=$(( RANDOM % len ))
	jq -r ".[$rand] | \"\\(.name): \\(.desc)\"" "$motd"
} "$HOME/.motd-name.json"


it_time_section "starship"

if [[ $+commands[starship] ]]; then
	if [[ $commands[starship] -nt "$ZSH_CACHE_DIR/starship_init.zsh" ]]; then
		starship init zsh --print-full-init >! "$ZSH_CACHE_DIR/starship_init.zsh"
	fi
	source "$ZSH_CACHE_DIR/starship_init.zsh"
fi

it_time_section "gcloud sdk"

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/tools/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/tools/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/tools/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/tools/google-cloud-sdk/completion.zsh.inc"; fi

it_time_section "misc path adjustments"
# perl 6
path=(~/.perl6/bin /opt/rakudo-pkg/bin /opt/rakudo-pkg/share/perl6/site/bin $path[@])
# go
export GOPATH=$HOME/gopath
path+=/usr/local/go/bin/
path+=$GOPATH/bin/

it_time_section "hub"

[[ $+commands[hub] ]] && eval "$(hub alias -s)"

it_time_section ""

hash -d pexip=$HOME/repos/github.com/pexip videxio=$HOME/repos/github.com/videxio me=$HOME/repos/github.com/itsbth

# Wasmer
export WASMER_DIR="$HOME/.wasmer"
[ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"

export WASMTIME_HOME="$HOME/.wasmtime"

export PATH="$WASMTIME_HOME/bin:$PATH"

if [[ -n "$ZSH_PROFILE_ZSHRC" ]]; then
	unsetopt XTRACE
	exec 2>&3 3>&-
fi

zpcompinit; zpcdreplay

# added by travis gem
[ ! -s "$HOME/.travis/travis.sh" ] || source "$HOME/.travis/travis.sh"
