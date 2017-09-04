alias reloadcli="source $HOME/.bashrc"
alias c="clear"
alias l="ls -ahlF"
alias pubkey="cat $HOME/.ssh/id_rsa.pub"
alias weather="curl -4 http://wttr.in"
alias togit="cd $HOME/git"
alias gl='git pull --prune'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gp='git push origin HEAD'
alias gd='git diff --color | sed "s/^\([^-+ ]*\)[-+ ]/\\1/" | less -r' # Remove `+` and `-` from start of diff lines; just rely upon color.
alias gc='git commit'
alias gca='git commit -a'
alias gco='git checkout'
alias gcb='git copy-branch-name'
alias gb='git branch'
alias gs='git status -sb' # upgrade your git if -sb breaks for you.
alias gac='git add -A && git commit -m'
