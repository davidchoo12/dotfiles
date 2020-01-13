# Path to your oh-my-zsh installation.
export ZSH="/home/david/.config/oh-my-zsh"

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"


# Plugins list
plugins=(vi-mode git z zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# Enable colors and change prompt:
autoload -U colors && colors
# PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%(4~|.../%3~|%~)%{$fg[red]%}]%{$reset_color%}$%b "

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
function open () {
    xdg-open "$*" &
}
alias v="nvim"
alias nvimconfig="nvim ~/.config/nvim/init.vim"
alias zshconfig="nvim ~/.zshrc"
alias m="ncmpcpp"

# agnoster theme hide david@DCPC
prompt_context(){}

# prompt dir max 15 char
prompt_dir() {
  prompt_segment blue black '%(4~|.../%3~|%~)'
}

# misc customizations
# disable shared history across instances of zsh
unsetopt share_history

# Install Ruby Gems to ~/gems
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"

# add paths for texlive following https://tex.stackexchange.com/a/95373
export PATH=/usr/local/texlive/2019/bin/x86_64-linux:$PATH
export INFOPATH=$INFOPATH:/usr/local/texlive/2019/texmf-dist/doc/info
export MANPATH=$MANPATH:/usr/local/texlive/2019/texmf-dist/doc/man

# display timestamp on right side
RPROMPT="[%t]"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
# not sure if this is needed: source /home/david/.rvm/scripts/rvm

#################################################
### Colorize Man pages
#################################################

export MANROFFOPT='-c'
export LESS_TERMCAP_mb=$(tput bold; tput setaf 2)
export LESS_TERMCAP_md=$(tput bold; tput setaf 6)
export LESS_TERMCAP_me=$(tput sgr0)
export LESS_TERMCAP_so=$(tput bold; tput setaf 3; tput setab 4)
export LESS_TERMCAP_se=$(tput rmso; tput sgr0)
export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 7)
export LESS_TERMCAP_ue=$(tput rmul; tput sgr0)
export LESS_TERMCAP_mr=$(tput rev)
export LESS_TERMCAP_mh=$(tput dim)
export PATH="/usr/local/sbin:$PATH"

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:.
