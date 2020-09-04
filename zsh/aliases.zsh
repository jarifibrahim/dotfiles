## For Git
alias ga="git add"
alias gb="git branch"
alias gc="git checkout"
alias gca="git checkout -- ."
alias gd="git diff"
alias gs="git status"
alias gg="git grep"
alias gp="git pull"

alias install="sudo apt install"
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
alias bb="$GOPATH/src/github.com/jarifibrahim/bar"

alias gtf="go test -v -failfast"
alias gtfb="go test -v -failfast -run ^$"
alias n="nvim"

alias c="clipcopy"

# Global in-replace replacement alias
alias -g G=' | grep'
alias xtime="/usr/bin/time -f '%Uu %Ss %er %MkB %C' "$@""

alias conv="echo "$@" | numfmt --to iec"

alias dz="dgraph zero"
alias mdz="make install && dgraph zero"
alias da="dgraph alpha"
alias mda="make install && dgraph alpha"
alias m="make install"
