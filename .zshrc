# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh
ZSH_THEME="robbyrussell"
plugins=(git, zsh-nvm)

export PATH="$HOME/.bin:$PATH"

source ~/.aliases
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"


terminate(){
 lsof -P | grep ':3000' | awk '{print $2}' | xargs kill -9
}

#fasd
fasd_cache="$HOME/.fasd-init-bash"
eval "$(fasd --init auto)"

export PSQL_EDITOR=$(which nvim)

export PATH="/usr/local/sbin:$PATH"
eval alias git=hub
eval "$(hub alias -s)"
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/code/go
export PATH=$PATH:$GOPATH/bin
[ -f ~/.zshrc.local ] && . ~/.zshrc.local

source $ZSH/oh-my-zsh.sh

test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
