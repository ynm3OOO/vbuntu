#!/usr/bin/env bash

echo "creating symlink to configure files..."

if [ -f ~/.vimrc ]; then
    echo ".vimrc already exists, copy original file to .custom_bashrc."
    cp ~/.vimrc ~/.vimrc_bak
    rm ~/.vimrc
fi

ln -s $(pwd)/vbuntu.vimrc ~/.vimrc 
ln -s $(pwd)/vbuntu.bashrc ~/.custom_bashrc

echo -e "\nif [ -f ~/.custom_bashrc ]; then\n\t. ~/.custom_bashrc\nfi" >> ~/.bashrc


echo "generating ssh public key for github..."

cd ~/.ssh
yes | ssh-keygen -t ed25519 -C "noman.j.land@gmail.com"
cat id_ed25519.pub
cd -
echo -e "copy the public key to github setting\nthen press Enter to continue"
echo "https://github.com/settings/keys"
read -r input
if [[ -n $input ]]; then
    exit
fi


echo "update and upgrade apt..."

sudo apt update && sudo apt upgrade

echo "installing apt packages..."

sudo apt install vim bat exuberant-ctags git


echo "installing fzf..."

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
yes | ~/.fzf/install

echo "installing Vundle..."
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "installing Vim plugins through Vundle..."
vim +PluginInstall +qall
echo "dev environment setup complete, please\nsource ~/.bashrc"
