export ZSH="$HOME/.oh-my-zsh"
source ~/antigen.zsh
export TERM=xterm-256color
antigen use oh-my-zsh

antigen bundle git
antigen bundle tmux
antigen bundle lein
antigen bundle command-not-found
antigen bundle autojump

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen apply

plugins=(fzf)
export EDITOR=vim
# Enable Ctrl-x-e to edit command line
autoload -U edit-command-line
# Emacs style
zle -N edit-command-line
bindkey '^e' edit-command-line
bindkey '^x' edit-command-line
ZSH_THEME_RANDOM_CANDIDATES=(
  "robbyrussell"
  "philips"
)
ZSH_THEME="random"
export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin:$HOME/.local/bin:/mnt/c/Users/ayang3/AppData/Local/Programs/Microsoft\ VS\ Code/bin
source $ZSH/oh-my-zsh.sh
# eval "$(jump shell)"
# User configuration
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias ee="/mnt/c/windows/explorer.exe ."
eval "$(pyenv init --path)"
/mnt/c/windows/System32/wsl.exe -d wsl-vpnkit service wsl-vpnkit start
