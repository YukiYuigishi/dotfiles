#!/bin/bash
echo "Install Yuki environment"
DATA=`cat /etc/issue`
while read line
do
   echo $line
done << FILE
$DATA 
FILE
cd $HOME
apt update && apt upgrade -y && apt install -y git clangd-10  ninja-build gettext libtool curl libtool-bin autoconf automake cmake g++ pkg-config unzip

curl -sL install-node.now.sh/lts | bash
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installdein.sh
sh ./installdein.sh ~/.cache/dein
mkdir ~/tmp
mkdir -p ~/.cache/dein
mkdir ~/.config

###build neovim
echo "start neovim build"


git clone https://github.com/neovim/neovim ~/tmp/neovim

cd ~/tmp/neovim
make CMAKE_BUILD_TYPE=Release
mkdir -p $HOME/local/nvim
make CMAKE_INSTALL_PREFIX=$HOME/local/nvim install
##PATH
#export PATH="$HOME/local/nvim:$PATH"
git clone https://github.com/YukiYuigishi/dotfiles $HOME/tmp/dotfiles
echo "install dotfiles"
ln -s $HOME/tmp/dotfiles/nvim $HOME/.config/nvim

