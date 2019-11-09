## For Git
alias ga="git add"
alias gb="git branch"
alias gc="git checkout"
alias gca="git checkout -- ."
alias gd="git diff"
alias gs="git status"
alias gg="git grep"
alias gp="git pull upstream master"

alias dra="docker rm -v -f \$(docker ps -aq)"
alias c="code ."

# Use 'bat' instead of cat
alias cat=bat
# Clear system cache
alias cc="free -mh && sync && echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo swapoff -a && sudo swapon -a && free -mh"

alias d="$GOPATH/src/github.com/dgraph-io/dgraph"
alias b="$GOPATH/src/github.com/dgraph-io/badger"
alias rr="$GOPATH/src/github.com/dgraph-io/ristretto"
alias f="$GOPATH/src/github.com/jarifibrahim/foo"

alias gtf="go test -v -failfast"
alias n="nvim"

