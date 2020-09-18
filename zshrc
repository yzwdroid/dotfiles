export ZSH="/home/zyang/.oh-my-zsh"
source ~/antigen.zsh
antigen use oh-my-zsh

antigen bundle git
antigen bundle fzf
antigen bundle tmux
antigen bundle autojump
antigen bundle heroku
antigen bundle lein
antigen bundle command-not-found

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen apply

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="ys"
export PATH=$PATH:/usr/local/go/bin
source $ZSH/oh-my-zsh.sh
# User configuration
# alias ohmyzsh="mate ~/.oh-my-zsh"

