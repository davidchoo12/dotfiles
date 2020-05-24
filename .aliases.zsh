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
alias sdev="ssh -A dchoo.zdi.zendesk-dev.com"
alias py="python"
