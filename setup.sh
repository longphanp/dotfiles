#!/bin/env bash

#-----------Install Rosetta--------
sudo softwareupdate --install-rosetta

#-----------Install xcode------------
printf "\nInstall xcode ...\n"

if ! xcode-select --print-path &> /dev/null; then
    # Prompt user to install the XCode Command Line Tools
    xcode-select --install &> /dev/null

    # Wait until the XCode Command Line Tools are installed
    until xcode-select --print-path &> /dev/null; do
        sleep 5
    done

    printf "\nInstall XCode Command Line Tools\n"
    sudo xcodebuild -license
    printf "\nAgree with the XCode Command Line Tools licence\n"
fi

#-------------Create symlink----------
printf "\nCreate symlink ...\n"

FILES_TO_SYMLINK=$(find . -type f -name ".*" -not -name .DS_Store -not -name .git -not -name .macos | sed -e 's|//|/|' | sed -e 's|./.|.|' | sort) 

for file in ${FILES_TO_SYMLINK[@]}; do
    srcFile="$(pwd)/${file}"
    desFile="$HOME/$(printf "%s" "$file" | sed "s/.*\/\(.*\)/\1/g")" 
    ln -fs "$srcFile" "$desFile"
done

#-------------Install brew----------
printf "\nInstall brew ...\n"

command -v brew >/dev/null 2>&1 || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || { echo "Install brew failed!"; exit 1; }

#-------------Install brew----------
printf "\nInstall brew packages ...\n"
eval $(/opt/homebrew/bin/brew shellenv)
bash .brew/brew.sh || { echo "Install brew packages failed"; exit 1; }
bash .brew/cask.sh || { echo "Install brew cask failed"; exit 1; }


#-----------Install oh my zsh-------
printf "\nInstall oh my zsh ...\n"

if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
fi

#------------Install nvm-------------
printf "\nInstall nvm ...\n"
command -v nvm >/dev/null 2>&1 || curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash || { echo "Install nvm failed"; exit 1; }


#------------Install vim plug-------------
printf "\nInstall vim plug ...\n"

# Install vim plugins
curl -fLo ${HOME}/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

printf "\nInstalling Vim plugins...\n"

vim -E +PlugInstall +qall || true

# Install vim coc extensions
printf "\nInstalling Vim Coc Extensions...\n"
COC_EXTENSION_DIR=$HOME/.config/coc/extensions
(cp ./.vim/coc/package.json "$COC_EXTENSION_DIR" && cd "$COC_EXTENSION_DIR" && yarn install)

#-------------Change to zsh----------------
# change shell to zsh
chsh -s "$(command -v zsh)" || { echo "Failed to switch to zsh"; exit 1; }
source "$HOME/.zprofile"

# Config macos
sh .macos
