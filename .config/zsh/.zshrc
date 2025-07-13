# main zsh settings. env in ~/.zprofile

# source global shell alias & variables files
[ -f "$XDG_CONFIG_HOME/shell/alias" ] && source "$XDG_CONFIG_HOME/shell/alias"

# load modules
zmodload zsh/complist
autoload -U compinit && compinit

# completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# main opts
setopt interactive_comments # allow comments in shell
stty stop undef # disable accidental ctrl s

# history
HISTSIZE=1000000
SAVEHIST=1000000
HISTFILE="$XDG_CACHE_HOME/zsh_history" # move histfile to cache
HISTDUP=erase
setopt appendhistory
setopt inc_append_history
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# shell integrations
source <(fzf --zsh) # allow for fzf history (crtl + r)
eval "$(zoxide init --cmd cd zsh)"

# keybinds
bindkey -e # use emacs binds (crtl + f)
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey -s '^[s' "tmux-sessionizer\n"

# syntax highlighting
# requires zsh-syntax-highlighting package
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# autosuggestions
# requires zsh-autosuggestions package
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# add the greatest theme :>
# requires zsh-theme-powerlevel10k-git package
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f $XDG_CONFIG_HOME/zsh/.p10k.zsh ]] || source $XDG_CONFIG_HOME/zsh/.p10k.zsh

# replace zsh's default completition selection menu with fzf
# requires fzf-tab package
source /usr/share/zsh/plugins/fzf-tab-git/fzf-tab.zsh

