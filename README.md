# zm_dotfiles
My Current Dotfiles Setup

First you have to install homebrew, spectacles, iterm
Also install `hack` font and solarized color scheme for iterm.

##### Manual install
- `Brew install {fasd, vim, tmux, python, nvm, rbenv, cmake}`
- Vim-plug and make sure it compiles YCM
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
- use `nvm` & `rbenv` to install preferred versions
- links: `ln -sf repositories/config-files/.vimrc ~/.vimrc` etc.
- To make tmux copy work `brew install reattach-to-user-namespace` and [do this](https://evertpot.com/osx-tmux-vim-copy-paste-clipboard/)

