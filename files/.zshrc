# ~/.zshrc

# zsh
export ZSH=$HOME/.oh-my-zsh
export ZSH_COMPDUMP=$ZSH/zcompdump
export HISTFILE=$ZSH/history
ZSH_THEME="bira"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# user config
export LANG=en_US.UTF-8
export EDITOR=nano

alias yay="yay --aur"
alias szsh="source ~/.zshrc"
