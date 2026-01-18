# Path to your dotfiles
export DOTFILES=$HOME/.dotfiles

##############################################################
# Zinit and Plugins
##############################################################

ZINIT_HOME="${HOME}/.local/share/zinit/zinit.git"
source "${ZINIT_HOME}/zinit.zsh"

zinit snippet OMZP::git
zinit snippet OMZP::aws
zinit snippet OMZP::python
zinit snippet OMZP::rust
zinit snippet OMZP::ruby
zinit snippet OMZP::rails
zinit snippet OMZP::command-not-found
zinit snippet OMZP::autoenv

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

##############################################################
# Keybindings
##############################################################
bindkey -e
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
bindkey '^@' fzf-file-widget


##############################################################
# History settings
##############################################################
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

##############################################################
# Completion styling
##############################################################
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

##############################################################
# Custom folder
##############################################################
ZSH_CUSTOM=$DOTFILES

##############################################################
# Oh-My-Posh
##############################################################
eval "$(oh-my-posh init zsh --config $DOTFILES/oh-my-posh/theme.omp.json)"

##############################################################
# Zoxide
##############################################################
eval "$(zoxide init zsh)"

##############################################################
# FZF
##############################################################
source <(fzf --zsh)

##############################################################
# Custom configs
##############################################################
source $DOTFILES/zsh/aliases.zsh
source $DOTFILES/zsh/path.zsh
source $DOTFILES/zsh/custom_exports.zsh
