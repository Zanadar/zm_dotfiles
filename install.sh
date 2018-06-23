#!/bin/bash

BREW_PACKAGES=(
  direnv
  lpass-cli
  jq
  bash
  fasd

)

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
brew bundle --file=- <<EOF
tap "homebrew/services"
# Unix
brew "git"
brew "vim"
brew "fasd"
brew "jq"
brew "lastpass-cli", args: ["with-pinentry"]
brew "direnv"
brew "openssl"
brew "the_silver_searcher"
brew "bash"
# Programming languages
brew "python3"
brew "libyaml" # should come after openssl
EOF

#vim plugged
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
pip3 install --user neovim

# You still have to change your shell to zsh
# Also dont forget to run `:PlugInstall and :UpdateRemotePlugins` the first time your open nvim

ln -sf `pwd`/.bashrc ~/.bash_profile
ln -sf `pwd`/.vimrc ~/.vimrc
ln -sf `pwd`/.vimrc.bundles ~/.vimrc.bundles


