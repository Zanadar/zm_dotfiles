#!/usr/bin/env fish

if not which brew >/dev/null
    echo "Installing Homebrew ..."
    curl -fsS 'https://raw.githubusercontent.com/Homebrew/install/master/install' | ruby
end

echo "Updating Homebrew formulae ..."
brew update
brew bundle -v

if not brew outdated
    brew upgrade
end

brew cleanup

#vim plugged
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir -p $HOME/.config/fish

for f in fish/*
    rm -f $HOME/.config/fish/(basename $f)
    ln -s $PWD/$f $HOME/.config/fish/(basename $f)
end

mkdir -p $HOME/.config/fish/functions

for f in fish_functions/*
    rm -f $HOME/.config/fish/functions/(basename $f)
    ln -s $PWD/$f $HOME/.config/fish/functions/(basename $f)
end

mkdir -p $HOME/.config/fish/env

for f in fish_env/*
    rm -f $HOME/.config/fish/env/(basename $f)
    ln -s $PWD/$f $HOME/.config/fish/env/(basename $f)
end

mkdir -p $HOME/bin

for f in bin/*
    rm -f $HOME/bin/(basename $f)
    ln -s $PWD/$f $HOME/bin/(basename $f)
end

rm -f $HOME/.gitconfig
ln -s $PWD/.gitconfig $HOME/.gitconfig

rm -f $HOME/.vimrc
ln -s $PWD/.vimrc $HOME/.vimrc

rm -f $HOME/.vimrc.bundles
ln -s $PWD/.vimrc.bundles $HOME/.vimrc.bundles

rm -f $HOME/.tmux.conf
ln -s $PWD/.tmux.conf $HOME/.tmux.conf
