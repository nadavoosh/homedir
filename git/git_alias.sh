alias g=git
alias gwash='git branch --merged | egrep -v "^\*|master|staging" | xargs -n 1 git branch -d'
alias renameTag="!sh -c 'set -e;git tag $2 $1; git tag -d $1;git push origin :refs/tags/$1;git push --tags' -"
alias go="git checkout"

