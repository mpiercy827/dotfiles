#!/bin/bash
CURRENT_DIR=$(pwd)
DOTFILES_DIR=~/.dotfiles

# List of programs to install with brew
BREW=''
BREW+=' ncdu'
BREW+=' tmux'
BREW+=' tree'
BREW+=' vim'
BREW+=' wget'
BREW+=' zsh'

echo
echo "Setting up Homebrew and dependencies..."
if [[ $OSTYPE == darwin* ]]; then
  if ! type brew > /dev/null 2>&1; then
    echo "Installing brew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi
  echo "Installing $BREW..."
  brew install $BREW 2> /dev/null
fi
echo "...done"
echo

echo
echo "Setting up zsh..."
if [ ! -d ~/.oh-my-zsh ]; then
  echo "Installing Oh My Zsh..."
  curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
  chsh -s /bin/zsh
fi
mkdir -p ~/.oh-my-zsh/custom/themes
curl -o - https://raw.githubusercontent.com/denysdovhan/spaceship-zsh-theme/master/install.zsh | zsh
echo "...done"
echo

echo
echo "Setting up vim..."
if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
  mkdir -p ~/.vim/bundle
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  git submodule update --init --recursive
  ./install.sh
  cd $DOTFILES_DIR
  vim +PluginInstall +qall
  cd $CURRENT_DIR
fi
echo "...done"
echo
