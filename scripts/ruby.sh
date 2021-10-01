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
echo "Installing rbenv..."
if ! [ -x "$(command -v rbenv)" ]; then
  brew update
  brew install rbenv
else
  echo "rbenv already installed"
fi
echo "...done"
echo
