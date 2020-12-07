function open () {
  xdg-open "$*" &
}
alias v="nvim"
alias dfg='/usr/bin/git --git-dir=$HOME/dotfiles.git/ --work-tree=$HOME' # dotfiles git
alias nvimconfig="nvim ~/.config/nvim/init.vim"
alias zshconfig="nvim ~/.zshrc"
alias m="ncmpcpp"
alias python="python3"
alias pip="pip3"
# alias sdev="ssh -A ubuntu@10.0.0.85"
alias sdev="ssh dev"
alias snus="ssh nus"
alias sprod="ssh aws-prod"
alias sstg="ssh aws-stg"
alias py="python"
alias pssh='/Users/dchoo/Library/Python/3.7/bin/pssh -x "-o LogLevel=QUIET -o StrictHostKeyChecking=no -o UserKnownHostsFile=/tmp/UserKnownHostsFile.csv  -o GlobalKnownHostsFile=/tmp/GlobalKnownHostsFile.csv"'
alias psshsudo='/Users/dchoo/Library/Python/3.7/bin/pssh --inline -I -x "-o LogLevel=QUIET -o StrictHostKeyChecking=no -o UserKnownHostsFile=/tmp/UserKnownHostsFile.csv  -o GlobalKnownHostsFile=/tmp/GlobalKnownHostsFile.csv -tt"'
