#!/bin/env bash

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

# Update editor
brew install macvim

# better `top`
brew install glances

# Move file to trash
brew install trash

# Shell check for bash
brew install shellcheck 

# Install search tools
brew install the_silver_searcher 
brew install fzf
brew install ripgrep

# Dev tools
brew install git
brew install curl
brew install node
brew install yarn
brew install awscli
brew install llvm
brew install tmux
brew install sops
brew install cmake
brew install clang-format
brew install cocoapods

# Remove outdated versions from the cellar
brew cleanup
