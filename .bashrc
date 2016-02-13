export PATH="/Users/dranez/.rbenv/shims:/Users/dranez/.bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="$HOME/.bin:$PATH"
eval "$(rbenv init - --no-rehash zsh)"
export PATH="$HOME/.node/bin:$PATH"

# Avoid duplicates
export HISTCONTROL=ignoredups:erasedups
# When the shell exits, append to the history file instead of overwriting it
shopt -s histappend

# After each command, append to the history file and reread it
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"


# prompt
export PS1='\[\e[0;32m\]\W\[\e[1;32m\]${text} 👻 \[\e[0;37m\] '
if [ -n "$SSH_CLIENT" ]; then text=" ssh-session"
fi

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# nvm
source /usr/local/opt/nvm/nvm.sh

#fasd
fasd_cache="$HOME/.fasd-init-bash"
eval "$(fasd --init auto)"
export PATH="/usr/local/sbin:$PATH"
eval alias git=hub
eval "$(hub alias -s)"
export PATH=/usr/local/sbin:/usr/local/opt/nvm/versions/node/v5.5.0/bin:/Users/zanadar/.node/bin:/Users/zanadar/.rbenv/shims:/Users/zanadar/.bin:/Users/dranez/.rbenv/shims:/Users/dranez/.bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:~/Documents/nand2tetris/tools
export PATH=$PATH:/usr/local/opt/go/libexec/bin
export GOPATH=$HOME/work
export PATH=$PATH:$GOPATH/bin
