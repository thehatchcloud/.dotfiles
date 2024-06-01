#!/bin/bash

# Setup Zsh
# Set the default shell to zsh
sudo chsh $(id -un) --shell "/usr/bin/zsh"

# Create a user bin folder
mkdir $HOME/bin

## Assumming a Debian distribution, run system updates
sudo apt-get update
sudo apt-get -y upgrade

# Install tmux
sudo apt-get -y install tmux

# TPM for tmux should already be there, but if there is a problem,
# git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Install Neovim from download
wget -q https://github.com/neovim/neovim/releases/download/v0.9.4/nvim-linux64.tar.gz
tar zxvf nvim-linux64.tar.gz -C $HOME/bin
rm nvim-linux64.tar.gz

# Install exa for better ls functionality
sudo apt-get install exa

# Install stow for dotfile management
sudo apt-get install stow

# COMPLETE CONFIGURATION
# Now that everything is installed, symlink my files with stow
## Copy my .zshrc file into the home directory
stow -d $HOME/.dotfiles zsh # cp -f .zshrc $HOME
stow -d $HOME/.dotfiles oh-my-zsh # cp -f -R .oh-my-zsh/custom/ $HOME/.oh-my-zsh
stow -d $HOME/.dotfiles tmux # cp -f .tmux.conf $HOME
stow -d $HOME/.dotfiles nvim # cp -f -R config/nvim $HOME/.config
stow -d $HOME/.dotfiles git
