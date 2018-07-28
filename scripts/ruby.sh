echo
echo "Installing ruby..."
if ! [ -x "$(command -v ruby)" ]; then
  brew update
  brew install ruby
else
  echo "Ruby already installed"
fi
echo "...done"
echo

echo
echo "Installing rvm..."
if ! [ -x "$(command -v rvm)" ]; then
  \curl -sSL https://get.rvm.io | bash -s stable --ruby
  echo "source ~/.rvm/scripts/rvm" >> ~/.zshrc
else
  echo "RVM already installed"
fi
echo "...done"
echo
