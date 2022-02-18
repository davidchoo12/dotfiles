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

```bash
# zsh
sudo apt install -y zsh
# install.sh runs chsh which requires passwd to be set, see https://askubuntu.com/a/1100194/973343
ZSH=~/.config/oh-my-zsh KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
chsh -s $(which zsh) # requires relogin to take effect

# git, src https://git-scm.com/download/linux
sudo add-apt-repository ppa:git-core/ppa
sudo apt update
sudo apt install git

# setup ssh, src https://help.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent

# clone as bare repo, src https://www.atlassian.com/git/tutorials/dotfiles
git clone --bare git@github.com:davidchoo12/dotfiles.git ~/dotfiles.git
alias dfg='/usr/bin/git --git-dir=$HOME/dotfiles.git/ --work-tree=$HOME'
dfg checkout
# overwrite existing untracked configs
dfg reset --hard master
# make `dfg status` to only show tracked files cos $HOME will contain many unrelated untracked files
dfg config --local status.showUntrackedFiles no

# setup gpg signing key for github (to show verified badge on commits)
# src https://help.github.com/en/github/authenticating-to-github/generating-a-new-gpg-key
# use ed25519 cos newer and trusted, src https://www.gnupg.org/faq/whats-new-in-2.1.html#ecc
sudo apt install gpg
gpg --full-gen-key --expert
# select ECC (sign only), Curve 25519, key does not expire, email use noreply.github.com
gpg --list-secret-keys --keyid-format LONG # copy the secret key id
gpg --armor --export #<secret key id>
# copy output and add to GPG keys at https://github.com/settings/keys
# add to global .gitconfig, src https://help.github.com/en/github/authenticating-to-github/telling-git-about-your-signing-key
git config --global user.signingkey #<secret key id>

# neovim
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt install neovim
# vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
# run :PlugInstall and exit
nvim +PlugInstall +qall > /dev/null

# fonts
# install Segoe UI, src https://github.com/mrbvrz/segoe-ui-linux
# install meslo nerd font for p10k https://github.com/romkatv/powerlevel10k/#meslo-nerd-font-patched-for-powerlevel10k
# found UI bug in gnome-font-viewer https://github.com/microsoft/cascadia-code/issues/50#issuecomment-633187177
# use gnome-tweaks fonts to update system fonts

# compton
sudo apt install compton
# restarting compton
pkill compton
compton --config ~/.config/compton/compton.conf -b

# polybar
# installation see https://github.com/polybar/polybar#getting-started
# building from source below, see https://github.com/polybar/polybar/wiki/Compiling
# download tar from https://github.com/polybar/polybar/releases and extract
tar xvf polybar-*.tar
cd polybar
# build deps
sudo apt install build-essential git cmake cmake-data pkg-config python3-sphinx libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python3-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev
# optional deps for modules
sudo apt install libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev libasound2-dev libpulse-dev i3-wm libjsoncpp-dev libmpdclient-dev libcurl4-openssl-dev libnl-genl-3-dev
# build
mkdir build
cd build
cmake ..
make -j$(nproc)
# install the polybar executable in /usr/local/bin
sudo make install

# polybar theme
# currently using https://github.com/adi1090x/polybar-themes#-polybar-6
# on commit https://github.com/adi1090x/polybar-themes/commit/786166cf976d4a64f90bb108fb76bb4eb33555f3
# reinstall if has newer updates on polybar 6 or using other polybar theme
git clone --depth=1 https://github.com/adi1090x/polybar-themes
cd polybar-themes/polybar-6
cp -r fonts/* ~/.local/share/fonts
# if on ubuntu
  sudo dkpg-reconfigure fontconfig-config
  sudo rm /etc/fonts/conf.d/70-no-bitmaps.conf
fc-cache -v
# skip these cos alr in this repo
# cp -r * ~/.config/polybar
# ~/.config/polybar/launch.sh

# fzf
# check installation method https://github.com/junegunn/fzf#installation
# install from git
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all --xdg --no-bash --64

# for macos, add symbolic links to open apps from terminal
ln -s '/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl' /usr/local/bin/subl
ln -s '/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code' /usr/local/bin/code
```

## List of softwares to install
- [delta (pretty diff tool)](https://github.com/dandavison/delta/)