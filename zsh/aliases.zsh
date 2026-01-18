# Shortcuts

alias copyssh="pbcopy < $HOME/.ssh/id_ed25519.pub"
alias reloadshell="exec zsh"
alias ls='eza --icons'
alias ll='eza -l --icons'
alias la='eza -la --icons'
alias rm='rm -i'
alias vim='nvim'
alias c='clear'

# Directories
alias dotfiles="cd $DOTFILES"
alias projects="cd $HOME/workspace"

# JS/TS
alias nfresh="rm -rf node_modules/ package-lock.json && yarn install"
alias watch="yarn dev"

# Git
alias stash="git stash -u"

# History
alias history='history 1'

# Rails
alias rc='bin/rails console'
alias rs='bin/rails server'
alias db='bin/rails db:console'
alias rmig='bin/rails db:migrate'
alias rback='bin/rails db:rollback'