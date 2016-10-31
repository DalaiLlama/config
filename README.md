git clone https://github.com/DalaiLlama/config.git ~/Softdev/projects

## Vim
```
mkdir -p ~/Softdev/projects/vim
pushd ~/Softdev/projects/
git clone https://github.com/vim/vim.git vim
./configure --with-features=huge --enable-multibyte --enable-rubyinterp --enable-python3interp \
        --with-python3-config-dir=/usr/lib/python3.5/config-3.5m-x86_64-linux-gnu \
        --enable-perlinterp --enable-gui=gtk2 --enable-cscope --prefix=/usr

make VIMRUNTIMEDIR=/usr/share/vim/vim80

sudo make install

ln -s ~/.config/config/vimrc ~/.vimrc

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/vundle
```

## dot files
```
ln -fs ~/Softdev/projects/config/.bash_aliases ~/.bash_aliases
ln -fs ~/Softdev/projects/config/.bash_functions ~/.bash_functions
ln -fs ~/Softdev/projects/config/.gitconfig ~/.gitconfig
ln -fs ~/Softdev/projects/config/.gitignore ~/.gitignore
ln -fs ~/Softdev/projects/config/.tmux ~/.tmux
ln -fs ~/Softdev/projects/config/.tmux.conf ~/.tmux.conf
ln -fs ~/Softdev/projects/config/vimrc ~/.vimrc
```

## Solarlized

```
git clone https://github.com/seebi/dircolors-solarized.git
git clone https://github.com/altercation/solarized.git
git clone https://github.com/Anthony25/gnome-terminal-colors-solarized.git
```

## General packages
```
sudo apt-get install ubuntu-restricted-extras build-essentials meld git
```
