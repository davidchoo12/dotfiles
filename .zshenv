# Path to your oh-my-zsh installation.
export ZSH="$HOME/.config/oh-my-zsh"

# for homebrew
export PATH=$PATH:$HOME/bin:/usr/local/bin
export LC_ALL=en_US.UTF-8

# Install Ruby Gems to ~/gems
# export GEM_HOME="$HOME/gems"
# export PATH="$HOME/gems/bin:$PATH"
# export PATH="/usr/local/opt/ruby/bin:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
# export PATH="$PATH:$HOME/.rvm/bin"
# not sure if this is needed: source /home/david/.rvm/scripts/rvm

# add paths for texlive following https://tex.stackexchange.com/a/95373
export PATH=/usr/local/texlive/2019/bin/x86_64-linux:$PATH
export INFOPATH=$INFOPATH:/usr/local/texlive/2019/texmf-dist/doc/info
export MANPATH=$MANPATH:/usr/local/texlive/2019/texmf-dist/doc/man

# for artifactory
# export PATH=$PATH:$HOME/development/artifactory-oss-6.17.0/bin

# for rbenv
export PATH="$PATH:$HOME/.rbenv/bin"

# for pyenv (shims need to be before /usr/bin otherwise $(which python3) eval to /usr/bin/python3)
command -v pyenv >/dev/null 2>&1 && eval "$(pyenv init -)"

# for java
export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
export PATH=$PATH:$JAVA_HOME/bin

# for setting dotenv to always (see https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/dotenv)
export ZSH_DOTENV_PROMPT=false

source "$HOME/.cargo/env"
export NVM_DIR="$HOME/.nvm"

# for alacritty
export PATH="$PATH:$HOME/.cargo/bin"
