echo
echo "Installing node..."
if ! [ -x "$(command -v node)" ]; then
  brew update
  brew install node
else
  echo "Node already installed"
  echo "$(node --version)"
fi
echo "...done"
echo

echo
echo "Installing useful node packages..."
if ! [ -x "$(command -v nodenv)" ]; then
  brew update
  brew install nodenv
  nodenv init
fi
echo "...done"
echo
