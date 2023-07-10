#!/usr/bin/env bash

echo "creating symlink to configure files..."

ln -s ./vbuntu.vimrc ~/.vimrc 
ln -s ./vbuntu.bashrc ~/.custom_bashrc

echo -e "if [ -f ~/.custom_bashrc ]; then\n\t. ~/.custom_bashrc\nfi" >> .bashrc


echo "generating ssh public key for github..."

cd ~/.ssh
ssh-keygen -t ed25519 -C "noman.j.land@gmail.com"
cd -
echo -e "copy the public key to github setting\n
then press Enter to continue"
echo "https://github.com/settings/keys"
read -r input
if [[ -n $input ]]; then
    exit
fi


echo "update and upgrade apt"

sudo apt update && apt upgrade
sudo apt install vim bat exuberant-ctags git


echo "installing fzf..."

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

echo "installing Vundle..."
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "installing Vim plugins through Vundle..."
vim +PluginInstall +qall
echo "dev environment updated"
