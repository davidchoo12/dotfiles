# Dotfiles
This repo contains config files for my linux setup. The files are selectively copied over to the local repo so that git doesn't track all the files in the home dir.

These files are positioned in dirs for Ubuntu but contains configs that also work for MacOS, so when setting up for MacOS, just need to copy the configs into their respective directories. The following configs are in different directories per OS:

**OSX**
- **Sublime Text 3**: $HOME/Library/Application Support/Sublime Text 3/
- **VS Code**: $HOME/Library/Application Support/Code/

**Windows**
- **Sublime Text 3**: %APPDATA%/Sublime Text 3/
- **VS Code**: %APPDATA%/Code/

## Installation

```
# clone as bare repo, src: https://www.atlassian.com/git/tutorials/dotfiles
git clone --bare https://github.com/davidchoo12/dotfiles ~/dotfiles.git
alias dfg='/usr/bin/git --git-dir=$HOME/dotfiles.git/ --work-tree=$HOME'
dfg checkout

# zsh
sudo apt install -y zsh
ZSH=~/.config/oh-my-zsh KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" # will execute chsh which requires passwd to be set, see https://askubuntu.com/a/1100194/973343
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# neovim
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt install neovim
# vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
# run :PlugInstall and exit
nvim +PlugInstall +qall > /dev/null
```
