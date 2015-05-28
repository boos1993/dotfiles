result=${PWD}

printf '%s' 'Installing Files...'

cp bash/bash_aliases ~/.bash_aliases

cp -r  scripts ~/scripts

cp vim/vimrc ~/.vimrc

printf '%s\n' 'Done'
