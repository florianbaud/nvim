#!/bin/bash

# Install Neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
rm -rf /opt/nvim-linux-x86_64
tar -C /opt -xzf nvim-linux-x86_64.tar.gz

# Install Treesitter
curl -LO https://github.com/tree-sitter/tree-sitter/releases/latest/download/tree-sitter-cli-linux-x64.gz
