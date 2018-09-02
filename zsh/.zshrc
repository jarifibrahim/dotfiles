# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=/home/ijarif/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

## For Git
alias ga="git add"
alias gb="git branch"
alias gc="git checkout"
alias gca="git checkout -- ."
alias gd="git diff"
alias gs="git status"
alias gg="git grep"
alias gp="git pull upstream master"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export GOPATH=$HOME/Projects/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN
export PATH=$PATH:/usr/local/go/bin

alias dcm="docker-compose up -d db-auth auth db && make migrate-database"
alias dra="docker rm -f \$(docker ps -aq)"
alias db="pgcli postgres://postgres:mysecretpassword@localhost:5432/postgres"

export GOCACHE=off

alias wit="cd $GOPATH/src/github.com/fabric8-services/fabric8-wit"
alias run-pr='function _run_pr(){ docker pull registry.devshift.net/fabric8-ui/fabric8-planner:SNAPSHOT-PR-$1 && docker run -it -p 5000:8080 registry.devshift.net/fabric8-ui/fabric8-planner:SNAPSHOT-PR-$1 }; _run_pr'
alias log-prod-preview="f() { git log --oneline \$(curl -s https://api.prod-preview.openshift.io/api/status | jq .commit | tr -d '\"' | cut -c 1-8)..upstream/master};"
alias log-prod='f() { local commit=$(curl -s https://api.openshift.io/api/status  | jq .commit | tr -d '\"' | cut -c 1-8); git log --oneline -n 30 upstream/master | grep --color -E "^|$commit.*" }; f'
alias diff-prod="git log --oneline \$(curl -s https://api.openshift.io/api/status  | jq .commit | tr -d '\"' | cut -c 1-7)..upstream/master"

# Rust Cargo binaries
export PATH=$PATH:$HOME/.cargo/bin

# Use 'bat' instead of cat
alias cat=bat
