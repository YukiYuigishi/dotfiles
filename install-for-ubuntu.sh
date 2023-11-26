#!/bin/bash
# install dependencies
sudo apt-get update && sudo apt get upgrade -y

# install packages
sudo apt-get install vim gcc g++ clang tmux git ripgrep bat exa fish -y

# install neovim build prerequisites
sudo apt-get install ninja-build gettext cmake unzip curl git -y


echo "download dotfiles"
git clone https://github.com/YukiYuigishi/dotfiles.git ~/.dotfiles

echo "install neovim"
cd /tmp
git clone -b stable --depth=1 https://github.com/neovim/neovim.git
cd neovim
git checkout stable
make CMAKE_BUILD_TYPE=Release -j
sudo make install 

echo "migrate dotfiles"
mkdir -p $HOME/.config
cd $HOME/.config
ln -s $HOME/.dotfiles/code code
ln -s $HOME/.dotfiles/git git 
ln -s $HOME/.dotfiles/i3 i3
ln -s $HOME/.dotfiles/i3status i3status
ln -s $HOME/.dotfiles/ideavim ideavim
ln -s $HOME/.dotfiles/nvim nvim
ln -s $HOME/.dotfiles/zsh zsh

#curl -sL install-node.vercel.app/lts | sudo bash 
#curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
nvim -v
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync' -c 'TSUpdate' -c 'q'
echo 
echo "install finish'
