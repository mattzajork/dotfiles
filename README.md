# Install

```
git clone https://github.com/mzajork/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install
```

To finalize Vim customization, install `vim-plug` and install the plugins with:

```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim

:PlugInstall
```
