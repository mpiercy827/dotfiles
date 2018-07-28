echo
echo "Installing go..."
if ! [ -x "$(command -v go)" ]; then
  brew update
  brew install go
else
  echo "Go already installed"
  echo "$(go --version)"
fi
echo "...done"
echo
