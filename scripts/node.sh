echo
echo "Installing node..."
if ! [ -x "$(command -v node)" ]; then
  brew update
  brew install node
else
  echo "Node already installed"
fi
echo "...done"
echo

echo
echo "Installing nodenv..."
if ! [ -x "$(command -v nodenv)" ]; then
  brew update
  brew install nodenv
  nodenv init
else
  echo "nodenv already installed"
fi
echo "...done"
echo
