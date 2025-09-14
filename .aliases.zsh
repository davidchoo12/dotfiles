function open () {
  xdg-open "$*" &
}
alias v="nvim"
alias dfg='/usr/bin/git --git-dir=$HOME/dotfiles.git/ --work-tree=$HOME -c status.showuntrackedfiles=no -c user.email=7817101+davidchoo12@users.noreply.github.com -c commit.gpgsign=false' # dotfiles git
alias nvimconfig="nvim ~/.config/nvim/init.vim"
alias zshconfig="nvim ~/.zshrc"
alias m="ncmpcpp"
alias python="python3"
alias pip="pip3" # for the case when pyenv uses system version
alias sdev="ssh dev"
alias snus="ssh nus"
alias sprod="ssh aws-prod"
alias sstg="ssh aws-stg"
alias py="python"
alias py2="python2"
alias r="ranger"
alias pssh='/Users/dchoo/Library/Python/3.7/bin/pssh -x "-o LogLevel=QUIET -o StrictHostKeyChecking=no -o UserKnownHostsFile=/tmp/UserKnownHostsFile.csv  -o GlobalKnownHostsFile=/tmp/GlobalKnownHostsFile.csv"'
alias psshsudo='/Users/dchoo/Library/Python/3.7/bin/pssh --inline -I -x "-o LogLevel=QUIET -o StrictHostKeyChecking=no -o UserKnownHostsFile=/tmp/UserKnownHostsFile.csv  -o GlobalKnownHostsFile=/tmp/GlobalKnownHostsFile.csv -tt"'
# for kattis
# compiles and test with sample input, eg usage: G buka.cc 2
G() {
  if [ $# -eq 2 ]
  then
    curl -sSf "https://open.kattis.com/problems/${1%.*}" | grep -oPz '(?s)Sample Output '$2'.+?<pre>.*?(?=<\/pre>\s*<\/td>\s*<td>)' | grep -oPz '(?s)(?<=<pre>).+' | head -n -1 > in.txt
  fi
  g++ $1 && ./a.out < in.txt
}
submit() {
  py submit.py $1
}
kt() {
  curl -sSf "https://open.kattis.com/problems/$1" | grep -oPz '(?s)Sample Output 1.+?<pre>.*?(?=<\/pre>\s*<\/td>\s*<td>)' | grep -oPz '(?s)(?<=<pre>).+' | head -n -1 > in.txt
  nvim "$1.cc"
}
alias gloga="git log --pretty='%C(auto)%h%C(auto)%d %s %C(green)%an %C(cyan)%cd' --graph --date=relative --date-order --all"
alias glog="git log --pretty='%C(auto)%h%C(auto)%d %s %C(green)%an %C(cyan)%cd' --graph --date=relative --date-order"

alias jq='jq -C'
