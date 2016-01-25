export PATH="/Users/dranez/.rbenv/shims:/Users/dranez/.bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="$HOME/.bin:$PATH"
eval "$(rbenv init - --no-rehash zsh)"
export PATH="$HOME/.node/bin:$PATH"
if [ -n "$SSH_CLIENT" ]; then text=" ssh-session"
fi
export PS1='\[\e[1;32m\]\u \[\e[0;32m\]\W \[\e[1;32m\]${text} $\[\e[0;37m\] '

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

fasd_cache="$HOME/.fasd-init-bash"#fasd
eval "$(fasd --init auto)"
export PATH="/usr/local/sbin:$PATH"
