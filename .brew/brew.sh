#!/bin/env bash

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

# Update editor
brew install macvim

# better `top`
brew install glances

# Shell check for bash
brew install shellcheck 

# Install search tools
brew install the_silver_searcher 
brew install fzf

# Dev tools
brew install git
brew install curl
brew install node
brew install yarn
brew install aws
brew install llvm
brew install tmux
brew install sops
brew install cmake
brew install clang-format

# Remove outdated versions from the cellar
brew cleanup
