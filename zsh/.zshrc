
### Added by Zplugin's installer
source '/home/itsbth/.zplugin/bin/zplugin.zsh'
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
### End of Zplugin's installer chunk

zplugin ice wait"0" blockf
zplugin light zsh-users/zsh-completions

zplugin ice wait"0" atload"_zsh_autosuggest_start"
zplugin light zsh-users/zsh-autosuggestions

zplugin ice wait"0" atinit"zpcompinit; zpcdreplay"
zplugin light zdharma/fast-syntax-highlighting

zplugin light zsh-users/zsh-history-substring-search

zplugin ice pick"async.zsh" src"pure.zsh"
zplugin light sindresorhus/pure

zplugin ice from'gh-r' as'command' pick'hub-*/bin/hub'
zplugin light 'github/hub'

zplugin ice from"gh-r" as"program"
zplugin load junegunn/fzf-bin

zplugin ice multisrc"shell/{completion,key-bindings}.zsh" pick"bin/fzf-tmux" as"program"
zplugin light junegunn/fzf
