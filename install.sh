#!/bin/bash

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

zsh -c 'source $HOME/.zshrc; ln -nfs $PWD/zsh/envs.zsh $ZSH_CUSTOM/envs.zsh'

if [ ! -d /opt/homebrew ]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew bundle --file=$PWD/Brewfile

zsh -c 'source $HOME/.zshrc; ln -nfs $PWD/zsh/mise.zsh $ZSH_CUSTOM/mise.zsh; ln -nfs $PWD/zsh/aliases.zsh $ZSH_CUSTOM/aliases.zsh'

ln -nfs $PWD/cursor/settings.json $HOME/Library/Application\ Support/Cursor/User/settings.json
ln -nfs $PWD/gitconfig $HOME/.gitconfig
ln -nfs $PWD/gemrc $HOME/.gemrc
ln -nfs $PWD/irbrc $HOME/.irbrc
ln -nfs $PWD/rspec $HOME/.rspec

defaults write NSGlobalDomain AppleKeyboardUIMode -int 2
defaults write -g ApplePressAndHoldEnabled -bool false
