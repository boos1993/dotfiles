#!/bin/bash

BASHALIASES_FILE=~/.bash_aliases
SCRIPTS_FILE=~/scripts
VIMRC_FILE=~/.vimrc
GITCONFIG_FILE=~/.gitconfig
GITIGNORE_FILE=~/.gitignore




# Replaces a config constant
function set_config {
    sudo sed -i "s/^\($1\s*=\s*\).*\$/\1$2/" $3
    }

result=${PWD}
printf '%s' 'Installing Files...'
echo

echo -n "Git Full Name: "
read GIT_GLOBAL_USER_NAME
echo -n "Git Email: "
read GIT_GLOBAL_USER_EMAIL
echo

# user aliases
cp ./bash/.bash_aliases $BASHALIASES_FILE

# user scripts
cp -r  scripts $SCRIPTS_FILE

# vim
cp ./vim/.vimrc $VIMRC_FILE

# git
cp ./git/.gitconfig $GITCONFIG_FILE

set_config "GIT_GLOBAL_USER_NAME" $GIT_GLOBAL_USER_NAME $GITCONFIG_FILE
set_config "GIT_GLOBAL_USER_EMAIL" $GIT_GLOBAL_USER_EMAIL $GITCONFIG_FILE

cp ./git/.gitignore $GITIGNORE_FILE

# Installs
apt-get install -y git vim

printf '%s\n' 'Done'
