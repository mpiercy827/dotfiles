#!/bin/bash
DEV_ENV_DIR=~/.dev-environment
OLD_DIR=$DEV_ENV_DIR/old

# Ensure we're in the dotfiles directory
cd $DEV_ENV_DIR

# List of dotfiles for home directory
FILES=''
FILES+=' .aliases'
FILES+=' .bash_profile'
FILES+=' .inputrc'
FILES+=' .vimrc'
FILES+=' .zshrc'

# List of programs to install with brew
BREW=''
BREW+=' tmux'
BREW+=' tree'
BREW+=' vim'
BREW+=' wget'
BREW+=' zsh'

echo
echo "Setting up dependencies..."
if [[ $OSTYPE == darwin* ]]; then
  if ! type brew > /dev/null 2>&1; then
    echo "Installing brew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi
  echo "Installing$BREW..."
  brew install $BREW 2> /dev/null
  if [ ! -d ~/.oh-my-zsh ]; then
    echo "Installing Oh My Zsh..."
    curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
    chsh -s /bin/zsh
  fi
fi
echo "...done"
echo

echo
echo "Copying home directory dotfiles..."
# Create directory to house current dotfiles
# as a backup so you can restore your previous
# setup
if [ ! -e $OLD_DIR ]; then
  echo "Creating directory for current dotfiles: $OLD_DIR..."
  mkdir $OLD_DIR
fi

for f in $FILES; do
  if [ -e ~/$f ]; then
    echo "Copying old ~/$f into $OLD_DIR..."
    cp ~/$f $OLD_DIR/$f
  fi
  cp $DEV_ENV_DIR/$f ~/$f
done
echo "...done"
echo

echo
echo "Setting up vim..."
if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
  mkdir -p ~/.vim/bundle
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  git submodule update --init --recursive
  ./install.sh
  cd $DEV_ENV_DIR
  vim +PluginInstall +qall
fi
echo "...done"
echo

echo
echo "Setting up zsh..."
mkdir -p ~/.oh-my-zsh/custom/themes
curl -o - https://raw.githubusercontent.com/denysdovhan/spaceship-zsh-theme/master/install.zsh | zsh
echo "...done"
echo
