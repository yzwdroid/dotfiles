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
ZSH_THEME_RANDOM_CANDIDATES=(
  "robbyrussell"
  "philips"
)
ZSH_THEME="random"
export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin:$HOME/.local/bin
source $ZSH/oh-my-zsh.sh
# eval "$(jump shell)"
# User configuration
# alias ohmyzsh="mate ~/.oh-my-zsh"
eval "$(pyenv init --path)"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# export PATH="/opt/homebrew/opt:$PATH"

# autoload edit-command-line
# zle -N edit-command-line
# bindkey -M vicmd 'v' edit-command-line
