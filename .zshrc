# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh
ZSH_THEME="robbyrussell"
plugins=(git, zsh-nvm)

export PATH="~/.rbenv/shims:~/.bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="$HOME/.bin:$PATH"
eval "$(rbenv init - --no-rehash zsh)"

source ~/.aliases
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"


#fasd
fasd_cache="$HOME/.fasd-init-bash"
eval "$(fasd --init auto)"

export PSQL_EDITOR=$(which nvim)

export PATH="/usr/local/sbin:$PATH"
eval alias git=hub
eval "$(hub alias -s)"
export PATH=/usr/local/sbin:~/.rbenv/shims:~/.bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:~/Documents/nand2tetris/tools:~/.local/bin
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/code/go
export PATH=$PATH:$GOPATH/bin
[ -f ~/.zshrc.local ] && . ~/.zshrc.local

eval "$(rbenv init -)"

source $ZSH/oh-my-zsh.sh

test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh
