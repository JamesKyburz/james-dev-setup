ZSH=$HOME/.oh-my-zsh
ZSH_THEME="muse"

plugins=(git zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
source ~/Documents/src/zsh_stuff/source_all.zsh

export NODE_PATH="/usr/local/lib/node_modules"
export EDITOR=vim

cdpath=(~/Documents/src)
alias src="cd $cdpath"
alias wifi=osx-wifi-cli

export PATH="$HOME/.yarn/bin:$PATH"
