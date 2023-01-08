#!bin/bash

apt install neovim

# Install Plugin Manager
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# Install Ripgrep -- Faster Grep
apt install ripgrep




