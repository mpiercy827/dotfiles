#!/bin/bash
CURRENT_DIR=$(pwd)
DOTFILES_DIR=~/.dotfiles
OLD_DOTFILES=$DOTFILES_DIR/old

# List of dotfiles for home directory
FILES=''
FILES+=' .aliases'
FILES+=' .bash_profile'
FILES+=' .gitignore'
FILES+=' .tmux.conf'
FILES+=' .vimrc'
FILES+=' .zshrc'

echo
echo "Setting up workspace..."
mkdir -p ~/Workspace
mkdir -p $DOTFILES_DIR
echo "...done"
echo

echo
echo "Copying home directory dotfiles..."
# Create directory to house current dotfiles
# as a backup so you can restore your previous
# setup
if [ ! -e $OLD_DOTFILES ]; then
  echo "Creating directory for current dotfiles: $OLD_DOTFILES..."
  mkdir $OLD_DOTFILES
fi

for f in $FILES; do
  if [ -e ~/$f ]; then
    echo "Copying old ~/$f into $OLD_DOTFILES..."
    cp ~/$f $OLD_DOTFILES/$f
  fi
  cp $CURRENT_DIR/$f ~/$f
done
echo "...done"
echo

echo
echo "Setting up dev tools..."
./scripts/tools.sh
echo "...done"
echo

echo
echo "Setting up language-specific environments..."
./scripts/elixir.sh
./scripts/node.sh
./scripts/go.sh
./scripts/ruby.sh
echo
