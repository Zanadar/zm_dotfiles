# Path to your oh-my-zsh installation.
export ZSH=/Users/zanadar/.oh-my-zsh
ZSH_THEME="robbyrussell"
plugins=(git)

# User configuration

export PATH="~/.rbenv/shims:~/.bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="$HOME/.bin:$PATH"
eval "$(rbenv init - --no-rehash zsh)"
export PATH="$HOME/.node/bin:$PATH"

source ~/.aliases
source /usr/local/opt/nvm/nvm.sh

#fasd
fasd_cache="$HOME/.fasd-init-bash"
eval "$(fasd --init auto)"
export PATH="/usr/local/sbin:$PATH"
eval alias git=hub
eval "$(hub alias -s)"
export PATH=/usr/local/sbin:/usr/local/opt/nvm/versions/node/v5.5.0/bin:/Users/dranez/.rbenv/shims:/Users/dranez/.bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:~/Documents/nand2tetris/tools
export PATH=$PATH:/usr/local/opt/go/libexec/bin
export GOPATH=$HOME/src/golang
export PATH=$PATH:$GOPATH/bin

eval "$(rbenv init -)"

source $ZSH/oh-my-zsh.sh

test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh
