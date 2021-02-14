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
alias vi=vim

export PATH="$HOME/.yarn/bin:$PATH"
export PATH="/usr/local/lib/node_modules/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/Library/Python/3.6/bin:$PATH"
export PATH="$HOME/.deno/bin:$PATH"

autoload bashcompinit
bashcompinit

source $ZSH/oh-my-zsh.sh
source ~/Documents/src/zsh_stuff/source_all.zsh
source <(npm completion)
source <(node --completion-bash)
source ~/.cargo/env

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /usr/local/lib/node_modules/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /usr/local/lib/node_modules/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /usr/local/lib/node_modules/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /usr/local/lib/node_modules/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh

# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /usr/local/lib/node_modules/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh ]] && . /usr/local/lib/node_modules/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh
