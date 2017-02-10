export NODE_PATH="/usr/local/lib/node_modules"
export EDITOR=vim

export LC_ALL=en_GB.UTF-8
export LANG=en_GB.UTF-8
export LANGUAGE=en_GB.UTF-8

ZSH=$HOME/.oh-my-zsh
ZSH_THEME="muse"
plugins=(git zsh-syntax-highlighting)

autoload -U add-zsh-hook

add-zsh-hook chpwd chpwd_update_npm_version

function chpwd_update_npm_version() {
  local version=$(npm version | head -n 1 | grep -v npm: | awk '{print $3}' | sed "s/[',]//g")
  if ! [ -z "$version" ]; then
    newps1=$(echo $PS1 | sed 's/\\@[^ ]*%//g' | sed "s/%~%/%~%\\\@$version%/")
    export PS1="$newps1"
  fi
}

source $ZSH/oh-my-zsh.sh
source ~/Documents/src/zsh_stuff/source_all.zsh

cdpath=(~/Documents/src)
alias src="cd $cdpath"
alias wifi=osx-wifi-cli
alias vi=vim

export PATH="$HOME/.yarn/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"
###-begin-npm-completion-### #
# npm command completion script
#
# Installation: npm completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: npm completion > /usr/local/etc/bash_completion.d/npm
#

if type complete &>/dev/null; then
  _npm_completion () {
    local words cword
    if type _get_comp_words_by_ref &>/dev/null; then
      _get_comp_words_by_ref -n = -n @ -w words -i cword
    else
      cword="$COMP_CWORD"
      words=("${COMP_WORDS[@]}")
    fi

    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$cword" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           npm completion -- "${words[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
  }
  complete -o default -F _npm_completion npm
elif type compdef &>/dev/null; then
  _npm_completion() {
    local si=$IFS
    compadd -- $(COMP_CWORD=$((CURRENT-1)) \
                 COMP_LINE=$BUFFER \
                 COMP_POINT=0 \
                 npm completion -- "${words[@]}" \
                 2>/dev/null)
    IFS=$si
  }
  compdef _npm_completion npm
elif type compctl &>/dev/null; then
  _npm_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       npm completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _npm_completion npm
fi
###-end-npm-completion-###
