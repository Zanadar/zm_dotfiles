#!/bin/bash

fancy_echo() {
  local fmt="$1"; shift

  # shellcheck disable=SC2059
  printf "\n$fmt\n" "$@"
}

if ! command -v brew >/dev/null; then
  fancy_echo "Installing Homebrew ..."
    curl -fsS \
      'https://raw.githubusercontent.com/Homebrew/install/master/install' | ruby

    export PATH="/usr/local/bin:$PATH"
fi

fancy_echo "Updating Homebrew formulae ..."
brew update
brew bundle -v
if [[ ! -z $(brew outdated) ]]; then
  brew upgrade
fi
brew cleanup

#vim plugged
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Also dont forget to run `:PlugInstall and :UpdateRemotePlugins` the first time your open nvim

ln -sf `pwd`/bash_profile ~/.bash_profile
ln -sf `pwd`/bashrc_local ~/.bashrc_local
ln -sf `pwd`/git_prompt.sh ~/.git_prompt.sh
ln -sf `pwd`/.vimrc ~/.vimrc
ln -sf `pwd`/.vimrc.local ~/.vimrc.local
ln -sf `pwd`/.vimrc.bundles ~/.vimrc.bundles
ln -sf `pwd`/.aliases ~/.aliases
ln -sf `pwd`/.gitconfig ~/.gitconfig
ln -sf `pwd`/.gitignore ~/.gitignore

