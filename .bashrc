export PATH="/Users/dranez/.rbenv/shims:/Users/dranez/.bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="$HOME/.bin:$PATH"
eval "$(rbenv init - --no-rehash zsh)"
export PATH="$HOME/.node/bin:$PATH"

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
