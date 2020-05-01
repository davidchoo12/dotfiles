# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="agnoster"
# https://github.com/romkatv/powerlevel10k#oh-my-zsh
ZSH_THEME="powerlevel10k/powerlevel10k"

# Plugins list
plugins=(git z zsh-syntax-highlighting zsh-autosuggestions colored-man-pages gpg-agent ssh-agent aws dotenv)

source $ZSH/oh-my-zsh.sh

# User configuration

# Enable colors and change prompt:
autoload -U colors && colors
# PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%(4~|.../%3~|%~)%{$fg[red]%}]%{$reset_color%}$%b "

# agnoster theme hide david@DCPC
# prompt_context(){}

# agnoster theme prompt dir max 15 char
# prompt_dir() {
#   prompt_segment blue black '%(4~|.../%3~|%~)'
# }

# display timestamp on right side
# RPROMPT="[%t]"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
source $HOME/.aliases


# misc customizations
# disable shared history across instances of zsh
unsetopt share_history

#################################################
### Colorize Man pages
#################################################

# export MANROFFOPT='-c'
# export LESS_TERMCAP_mb=$(tput bold; tput setaf 2)
# export LESS_TERMCAP_md=$(tput bold; tput setaf 6)
# export LESS_TERMCAP_me=$(tput sgr0)
# export LESS_TERMCAP_so=$(tput bold; tput setaf 3; tput setab 4)
# export LESS_TERMCAP_se=$(tput rmso; tput sgr0)
# export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 7)
# export LESS_TERMCAP_ue=$(tput rmul; tput sgr0)
# export LESS_TERMCAP_mr=$(tput rev)
# export LESS_TERMCAP_mh=$(tput dim)
# export PATH="/usr/local/sbin:$PATH"

# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:.


# added by travis gem
[ -f /Users/dchoo/.travis/travis.sh ] && source /Users/dchoo/.travis/travis.sh

# for rbenv
eval "$(rbenv init - zsh)"

# for gpg commit signature
# export GPG_TTY=$(tty)


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/dchoo/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/dchoo/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/dchoo/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/dchoo/google-cloud-sdk/completion.zsh.inc'; fi
