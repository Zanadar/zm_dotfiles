eval "$(direnv hook bash)"

[ -f ~/.bashrc_local ] && . ~/.bashrc_local

export VISUAL=vim
export EDITOR="$VISUAL"

export PATH="$HOME/.rbenv/bin:$PATH"
[[ `which rbenv` ]] && eval "$(rbenv init -)"

# Load the auto-completion script if rbenv was loaded.
[[ -e ~/.rbenv/completions/rbenv.bash ]] && source ~/.rbenv/completions/rbenv.bash; echo -ne "\033];${PWD##*/}\007"

# Setup git ps1
# alias __git_ps1="git branch 2>/dev/null | grep '*' | sed 's/* \(.*\)/(\1)/'"
[[ -f ~/.git-prompt.sh ]] && source ~/.git-prompt.sh

# Colorize host name
if type __git_ps1 > /dev/null 2>&1; then
    export PS1="\[\033[01;32m\]\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\[\033[01;32m\]\$(__git_ps1 ' %s')\[\033[00m\] $\[\e[0m\] "
else
    export PS1="\[\033[01;32m\]\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "
fi

alias reload="exec $(which bash) -l"

function load-key() {
  KEY_NAME=$1
  KEY_NAME=${KEY_NAME:-my-ssh-key}

  if [[ $? -eq 0 ]]; then
    /usr/bin/ssh-add -D
    op get item ${KEY_NAME} | jq -r .details.notesPlain | /usr/bin/ssh-add -t 2H -;
  fi
}

alias vkl='load-key'

export PATH="$HOME/.cargo/bin:$PATH"
