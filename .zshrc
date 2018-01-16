export NODE_PATH="/usr/local/lib/node_modules"
export EDITOR=vim

export LC_ALL=en_GB.UTF-8
export LANG=en_GB.UTF-8
export LANGUAGE=en_GB.UTF-8
export GOPATH=~/Documents/src/gopath/

ZSH=$HOME/.oh-my-zsh
ZSH_THEME="muse"
plugins=(git zsh-syntax-highlighting yarn)

cdpath=(~/Documents/src)
alias src="cd $cdpath"
alias wifi=osx-wifi-cli
alias vi=vim

export PATH="$HOME/.yarn/bin:$PATH"
export PATH="/usr/local/lib/node_modules/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/Library/Python/3.6/bin:$PATH"

source $ZSH/oh-my-zsh.sh
source ~/Documents/src/zsh_stuff/source_all.zsh
source <(npx --shell-auto-fallback zsh)
source <(npm completion)
