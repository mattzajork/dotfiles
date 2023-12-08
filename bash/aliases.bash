alias reloadcli="source $HOME/.bashrc"
alias c="clear"
alias l="ls -ahlF --color=auto"
alias pubkey="cat $HOME/.ssh/id_rsa.pub"
alias weather="curl -4 http://wttr.in"
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias wanip="curl ipinfo.io"
alias pws="keepassxc ~/Documents/database.kdbx &"
alias sc="import png:- | xclip -selection clipboard -t image/png"
alias vim='nvim'
alias vi='nvim'
# docker stuff
alias rustscan='sudo docker run -it --rm --name rustscan rustscan/rustscan:2.1.1'
alias bbot='sudo docker run --network host -v "$HOME/.bbot:/root/.bbot" -v "$HOME/.config/bbot:/root/.config/bbot" -it mzajork/bbot:latest "$@"'
