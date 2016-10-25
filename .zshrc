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

proxies () {
  anyconnect_process=$(ps aux | grep -v grep | grep -e 'AnyConnect.*Client.app')
  wifi_info=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I)
  if [[ $wifi_info == *NBCU_Corp* || -n "$anyconnect_process" ]]; then
    export http_proxy="http://proxyanbcge.nbc.com:80/"
    export https_proxy="http://proxyanbcge.nbc.com:80/"
    export no_proxy="auth.login.devcloudwest.inbcu.com, api.cloudeast.inbcu.com, login.cloudeast.inbcu.com, loggregator.cloudeast.inbcu.com, localhost, 127.0.0.1, login.spotilocal.com"
  else
    export http_proxy=""
    export https_proxy=""
  fi
}

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

export PSQL_EDITOR=$(which nvim)

export PATH="/usr/local/sbin:$PATH"
eval alias git=hub
eval "$(hub alias -s)"
export PATH=/usr/local/sbin:~/.rbenv/shims:~/.bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:~/Documents/nand2tetris/tools:~/.local/bin
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/code/go
export PATH=$PATH:$GOPATH/bin
[ -f ~/.zshrc_local ] && . ~/.zshrc_local

eval "$(rbenv init -)"

source $ZSH/oh-my-zsh.sh

test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh
