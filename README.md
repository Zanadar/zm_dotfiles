# zm_dotfiles
My Current Dotfiles Setup

First you have to install homebrew, spectacle, iterm
Also install `hack` font and solarized color scheme for iterm.

##### Manual install
- `Brew install {fasd, nvim, python3, rbenv, hub, tig, redis, postgresql, etc.}`
- `pip3 install --user neovim`
- Vim-plug and make sure it compiles YCM
-` git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm`
```
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
- use `nvm` & `rbenv` to install preferred versions
- links: `ln -sf repositories/zm_dotfiles/.nvimrc ~/.config/nvim/init.vim` etc.

