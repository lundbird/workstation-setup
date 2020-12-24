# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Set name of the theme to load --- if set to "random", it will
ZSH_THEME="robbyrussell"

# Set the plugins to load
plugins=(git aws brew compleat kube-ps1 docker kubectl zsh-autosuggestions zsh-syntax-highlighting)

# Setup Kubernetes prompt to show cluster and namespace: https://github.com/jonmosco/kube-ps1
PROMPT=$PROMPT'$(kube_ps1)'$'\n$'
RPROMPT="[%D{%m/%f}|%@]"

# Useful general shell commands and overrides
function chpwd() {
    emulate -L zsh
    ls
}

alias grep="grep --color=auto -nIs"
alias ip="ifconfig | grep 'inet ' | grep -v 127.0.0.1 | cut -d\  -f2"
alias zshconfig="vi ~/.zshrc"
alias gpom="git pull origin master"

function decrypt(){
	echo "$1" | base64 -D
}

# Useful kubectl commands and overrides not offered with the kubectl plugin
alias ktp="kubectl top pods"
alias ke="kubectl edit"
alias kgrs="kubectl get rs --sort-by metadata.creationTimestamp"

function ks() {
	kubectl get "$1" -A | grep -i "$2"
}

function ksn() {
	kubectl config set-context --current --namespace="$1"; kubectl get pods
}

function kv(){
	kubectl get $1 $2 -o yaml \
    | yq d - 'status' \
    | yq d - 'metadata.creationTimestamp' \
    | yq d - 'metadata.generation' \
    | yq d - 'metadata.resourceVersion' \
    | yq d - 'metadata.selfLink' \
    | yq d - 'metadata.uid' \
}

function kr(){
	kubectl run -it --restart=Never --rm test --image="$1" --requests="cpu=0m,memory=0Mi" -- sh
}

function ksi(){
	kubectl set image deploy/"$1" "$1"="$2"
}

function kgim(){
	kubectl get pod "$1" -o=jsonpath="{.spec.containers[0].image}" 
}

function kt(){
	{ 
	  kubectl get deploy -A -o yaml &\
	  kubectl get service -A -o yaml &\
	  kubectl get secrets -A -o yaml &\
	  kubectl get configmap -A -o yaml &\
	  kubectl get ingress -A -o yaml &\
	  kubectl get daemonset -A -o yaml 
	} | grep "$1"
}

function ku(){
  kubectl config use-context "$1"
}
