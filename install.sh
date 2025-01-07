#!/bin/bash

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

zsh -c 'source $HOME/.zshrc; ln -nfs $PWD/zsh/envs.zsh $ZSH_CUSTOM/envs.zsh'

if [ ! -d /opt/homebrew ]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew bundle --file=$PWD/Brewfile

zsh -c 'source $HOME/.zshrc; ln -nfs $PWD/zsh/mise.zsh $ZSH_CUSTOM/mise.zsh'

ln -nfs $PWD/vscode/settings.json $HOME/Library/Application\ Support/Code/User/settings.json
ln -nfs $PWD/gitconfig $HOME/.gitconfig
ln -nfs $PWD/gemrc $HOME/.gemrc
ln -nfs $PWD/irbrc $HOME/.irbrc

defaults write NSGlobalDomain AppleKeyboardUIMode -int 2
