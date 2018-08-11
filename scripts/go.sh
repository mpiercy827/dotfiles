echo
echo "Installing go..."
if ! [ -x "$(command -v go)" ]; then
  brew update
  brew install go
  git config --global url."git@github.com:".insteadOf "https://github.com/"
else
  echo "Go already installed"
fi
echo "...done"
echo

echo
echo "Installing dep..."
if ! [ -x "$(command -v dep)" ]; then
  brew update
  brew install dep
  brew upgrade dep
else
  echo "dep already installed"
  echo "$(dep version)"
fi
echo "...done"
echo

echo
echo "Installing goenv..."
if ! [ -x "$(command -v goenv)" ]; then
  brew update
  brew install goenv
else
  echo "Goenv already installed"
  echo "$(goenv --version)"
fi
echo "...done"
echo
