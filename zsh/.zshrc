typeset -aUx path
fpath=($HOME/.zsh $fpath)
export path=($HOME/.local/bin /snap/bin "$path[@]")
alias dotstow='stow -d $HOME/repos/github.com/itsbth/dotfiles -t $HOME'
alias git=hub
alias lpass-fzf="lpass show -c --password \$(lpass ls  | fzf | awk '{print \$(NF)}' | sed 's/\]//g')"

take() { mkdir -p "$1" && cd "$1" }

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

### Added by Zplugin's installer
source '/home/itsbth/.zplugin/bin/zplugin.zsh'
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
### End of Zplugin's installer chunk

# zplugin start

zplugin light mollifier/anyframe
zplugin ice wait"0" blockf
zplugin light zsh-users/zsh-completions

zplugin ice wait"0" atload"_zsh_autosuggest_start"
zplugin light zsh-users/zsh-autosuggestions

zplugin ice wait"0" atinit"zpcompinit; zpcdreplay"
zplugin light zdharma/fast-syntax-highlighting

zplugin ice wait"0"
zplugin light zsh-users/zsh-history-substring-search

zplugin ice pick"async.zsh" src"pure.zsh"
zplugin light sindresorhus/pure

#zplugin snippet OMZ::lib/git.zsh
#zplugin light therealklanni/purity

zplugin ice from"gh-r" bpkick"*linux-amd64*" pick"hub-*/bin/hub" as"command"
zplugin light 'github/hub'

zplugin ice from"gh-r" as"command" mv"hivemind-* -> hivemind"
zplugin light DarthSim/hivemind

zplugin ice from"gh-r" as"program"
zplugin light junegunn/fzf-bin

zplugin ice pick"bin/fzf-tmux" as"program" multisrc"shell/{completion,key-bindings}.zsh"
zplugin light junegunn/fzf

zplugin ice wait"0"
zplugin light molovo/tipz

zplugin ice wait"0"
zplugin light marzocchi/zsh-notify

zplugin snippet PZT::modules/helper/init.zsh
zplugin ice atload"[ -d external/ ] || git clone https://github.com/zsh-users/zsh-completions external"
zplugin snippet PZT::modules/completion/init.zsh
zplugin snippet PZT::modules/history/init.zsh
zplugin snippet PZT::modules/environment/init.zsh
zplugin snippet PZT::modules/directory/init.zsh
zplugin ice svn
zplugin snippet PZT::modules/git/
#zplugin snippet PZT::modules/gpg/init.zsh
zplugin snippet PZT::modules/ssh/init.zsh
#zplugin ice wait"0" blockf
#zplugin snippet PZT::modules/history-substring-search/init.zsh

zplugin ice from"gh-r" bpick"*linux_amd64*" pick"ghq_*/ghq" as"command"
zplugin light motemen/ghq

zplugin light zdharma/zui
zplugin light zdharma/zplugin-crasis

eval $(thefuck --alias)

if [ $TERM = xterm-kitty ]; then
	kitty +kitten icat $HOME/Pictures/pexip-logo-hvit.svg
fi
