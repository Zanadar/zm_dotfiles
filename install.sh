#!/bin/bash

fancy_echo() {
  local fmt="$1"; shift

  # shellcheck disable=SC2059
  printf "\n$fmt\n" "$@"
}

#vim plugged
curl -fLo ~/.config/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

pushd ~/
  git clone https://github.com/Anthony25/gnome-terminal-colors-solarized.git
  cd gnome-terminal-colors-solarized
  ./install.sh
popd

# Also dont forget to run `:PlugInstall and :UpdateRemotePlugins` the first time your open nvim

ln -sf `pwd`/bash_profile ~/.bash_profile
ln -sf `pwd`/.bashrc ~/.bashrc
ln -sf `pwd`/bashrc_local ~/.bashrc_local
ln -sf `pwd`/git_prompt.sh ~/.git_prompt.sh
ln -sf `pwd`/.vimrc ~/.vimrc
ln -sf `pwd`/.vimrc.local ~/.vimrc.local
ln -sf `pwd`/.vimrc.bundles ~/.vimrc.bundles
ln -sf `pwd`/.aliases ~/.aliases
ln -sf `pwd`/.gitconfig ~/.gitconfig
ln -sf `pwd`/.gitignore ~/.gitignore

echo "done"
