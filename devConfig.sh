#!/usr/bin/env bash

# download binaries

cd ~/.ssh
ssh-keygen -o -t rsa -C “ssh@github.com”
cat id_rsa.pub
cd -
echo -e "copy the public key to github setting\n
then press Enter to continue"
echo "https://github.com/settings/keys"
read -r input
if [[ -n $input ]]; then
    exit
fi

apt update && apt upgrade
apt install vim bat exuberant-ctags git
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# configure

if [[ ! -d "Documents" ]]; then
    mkdir ~/Documents
fi

cd Documents
git clone --depth 1 git@github.com:ynm3OOO/vbuntu.git
cd -
ln -s ~/Documents/vbuntu/vbuntu.vimrc ~/.vimrc 
ln -s ~/Documents/vbuntu/vbuntu.bashrc ~/.custom_bashrc
echo -e "if [ -f ~/.custom_bashrc ]; then\n. ~/.custom_bashrc\nfi" >> .bashrc
vim +PluginInstall +qall
echo "dev environment updated"
