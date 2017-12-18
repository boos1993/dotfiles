#!/bin/bash

BASHALIASES_FILE=~/.bash_aliases
SCRIPTS_FILE=~/scripts
VIMRC_FILE=~/.vimrc
GITCONFIG_FILE=~/.gitconfig
GITIGNORE_FILE=~/.gitignore

# Replaces a config constant
function set_config {
	file=$1
	old_value=$2
	new_value=$3
	sed -i "s/${old_value}/${new_value}/g" $file
}

result=${PWD}
printf '%s' 'Installing Files...'
echo

echo -n "Git Full Name: "
read IN_GIT_GLOBAL_USER_NAME
echo -n "Git Email: "
read IN_GIT_GLOBAL_USER_EMAIL
echo

# user aliases
cp ./bash/.bash_aliases $BASHALIASES_FILE

# user scripts
cp -r  scripts $SCRIPTS_FILE

# vim
cp ./vim/.vimrc $VIMRC_FILE
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# git
cp ./git/.gitconfig $GITCONFIG_FILE
set_config "$GITCONFIG_FILE" "GIT_GLOBAL_USER_NAME" "$IN_GIT_GLOBAL_USER_NAME"
set_config "$GITCONFIG_FILE" "GIT_GLOBAL_USER_EMAIL" "$IN_GIT_GLOBAL_USER_EMAIL"

cp ./git/.gitignore $GITIGNORE_FILE

# Installs
sudo apt-get install -y git vim

printf '%s\n' 'Done'
