#!/bin/bash
sudo apt-get update && sudo apt get upgrade -y

# install packages
sudo apt-get install vim gcc g++ clang tmux git ripgrep bat exa 

# install neovim build prerequisites
sudo apt-get install ninja-build gettext cmake unzip curl

# install neovim
cd /tmp
git clone https://github.com/neovim/neovim.git
cd neovim
git checkout stable
make CMAKE_BUILD_TYPE=Release -j
sudo make install 

cd $HOME/.config
ln -s $HOME/.dotfiles/code code
ln -s $HOME/.dotfiles/git git 
ln -s $HOME/.dotfiles/i3 i3
ln -s $HOME/.dotfiles/i3status i3status
ln -s $HOME/.dotfiles/ideavim ideavim
ln -s $HOME/.dotfiles/nvim nvim
ln -s $HOME/.dotfiles/zsh zsh

curl -sL install-node.vercel.app/lts | sudo bash 
#curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source ~/.local/

nvim -v
nvim

