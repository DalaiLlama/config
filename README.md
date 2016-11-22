git clone https://github.com/DalaiLlama/config.git ~/Softdev/projects

## Vim
```
sudo apt-get install libncurses5-dev libgnome2-dev libgnomeui-dev \
    libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
    libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
    python3-dev lua5.1 lua5.1-dev libperl-dev git
```

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

mkdir ~/.tmp/vim-backup
mkdir ~/.tmp/vim-swap
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
ln -s ~/Softdev/projects/dircolors-solarized/dircolors.ansi-light ~/.dircolors

## General packages
```
sudo apt-get install ubuntu-restricted-extras build-essentials meld git
```
