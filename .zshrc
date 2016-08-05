# Path to your oh-my-zsh installation.
export ZSH=/Users/zanadar/.oh-my-zsh
ZSH_THEME="robbyrussell"
plugins=(git)

export PATH="~/.rbenv/shims:~/.bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="$HOME/.bin:$PATH"
eval "$(rbenv init - --no-rehash zsh)"
export PATH="$HOME/.node/bin:$PATH"

# Proxies
export http_proxy="http://proxyanbcge.nbc.com:80/"
export https_proxy="http://proxyanbcge.nbc.com:80/"
export no_proxy="auth.login.devcloudwest.inbcu.com, api.cloudeast.inbcu.com, login.cloudeast.inbcu.com, loggregator.cloudeast.inbcu.com, localhost, 127.0.0.1"

source ~/.aliases
source /usr/local/opt/nvm/nvm.sh

function proxy() {
  export http_proxy="http://proxyanbcge.nbc.com:80/"
  export https_proxy="http://proxyanbcge.nbc.com:80/"
  npm config set http-proxy="http://proxyanbcge.nbc.com:80/"
  npm config set https-proxy="http://proxyanbcge.nbc.com:80/"
}

function noproxy() {
  unset http_proxy
  unset https_proxy
  npm config rm http-proxy
  npm config rm https-proxy
}

#fasd
fasd_cache="$HOME/.fasd-init-bash"
eval "$(fasd --init auto)"

export PATH="/usr/local/sbin:$PATH"
eval alias git=hub
eval "$(hub alias -s)"
export
PATH=/usr/local/sbin:/usr/local/opt/nvm/versions/node/v5.5.0/bin:~/.rbenv/shims:~/.bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:~/Documents/nand2tetris/tools:~/.local/bin
export PATH=$PATH:/usr/local/opt/go/libexec/bin
export GOPATH=$HOME/src/golang
export PATH=$PATH:$GOPATH/bin

eval "$(rbenv init -)"

source $ZSH/oh-my-zsh.sh

test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh
