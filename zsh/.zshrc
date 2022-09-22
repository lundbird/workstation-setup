# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$PATH:/Users/alexlundberg/Library/Python/3.8/bin
export PATH=$PATH:$(go env GOPATH)/bin
export PATH=$PATH:/usr/local/texlive/2021/bin/universal-darwin
export GOPATH=$HOME/go

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
ZSH_THEME="alexlundberg"

# Set the plugins to load
plugins=(fzf git aws brew compleat docker zsh-autosuggestions zsh-completions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

#PROMPT=$PROMPT$'[%D{%m/%f}|%*]\n$'
#RPROMPT=""

# Useful general shell commands and overrides
function chpwd() {
    emulate -L zsh
    ls
}

alias git-recent-branches='git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format="%(refname:short)"'

alias genpasswd='pwgen -1 -s 32 | clipcopy'
alias tf="terraform"
alias tp="terragrunt plan"
alias ti="terragrunt init"
alias tap="terragrunt apply --auto-approve"
alias tg="terragrunt"
alias grep="grep --color=auto -nIs"
alias ip="ifconfig | grep 'inet ' | grep -v 127.0.0.1 | cut -d\  -f2"
alias zshconfig="vi ~/.zshrc"
alias gpom="git pull origin main"
alias gcm="git checkout main"
alias gcmr="git checkout master"
alias gpomr="git pull origin master"
alias tf="terraform"
alias sed="gsed"
alias brew="HOMEBREW_NO_AUTO_UPDATE=1 brew"

function decrypt(){
	echo "$1" | base64 -D
}

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion


function gettoken(){
  eval $(aws sts assume-role --role-arn "$1" --role-session-name test | jq -r '.Credentials | "export AWS_ACCESS_KEY_ID=\(.AccessKeyId)\nexport AWS_SECRET_ACCESS_KEY=\(.SecretAccessKey)\nexport AWS_SESSION_TOKEN=\(.SessionToken)\n"')
}

