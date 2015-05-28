result=${PWD}

printf '%s' 'Installing Files...'

cp bash/bash_aliases ~/.bash_aliases
cp -r  scripts ~/scripts

printf '%s\n' 'Done'
