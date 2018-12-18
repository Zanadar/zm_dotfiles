eval "$(direnv hook bash)"

# Load .bashrc and other files...
for file in ~/.{bashrc,bash_prompt,bashrc_local,aliases,functions,path,dockerfunc,extra,exports}; do
	if [[ -r "$file" ]] && [[ -f "$file" ]]; then
		# shellcheck source=/dev/null
		source "$file"
	fi
done
unset file

export VISUAL=nvim
export EDITOR="$VISUAL"

# Setup git ps1
# alias __git_ps1="git branch 2>/dev/null | grep '*' | sed 's/* \(.*\)/(\1)/'"
#[[ -f ~/.git-prompt.sh ]] && source ~/.git-prompt.sh

# Colorize host name
#if type __git_ps1 > /dev/null 2>&1; then
#    export PS1="\[\033[01;32m\]\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\[\033[01;32m\]\$(__git_ps1 ' %s')\[\033[00m\] $\[\e[0m\] "
#else
#    export PS1="\[\033[01;32m\]\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "
#fi


function load-key() {
  KEY_NAME=$1
  KEY_NAME=${KEY_NAME:-my-ssh-key}

  if [[ $? -eq 0 ]]; then
    /usr/bin/ssh-add -D
    op get item ${KEY_NAME} | jq -r .details.notesPlain | /usr/bin/ssh-add -t 2H -;
  fi
}

alias vkl='load-key'
alias ll='ls -la'
alias reload="exec $(which bash) -l"

export PATH=$PATH:/usr/local/go/bin
export PATH="$HOME/.cargo/bin:$PATH"
