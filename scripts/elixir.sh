echo
echo "Installing elixir..."
if ! [ -x "$(command -v elixir)" ]; then
  brew update
  brew install elixir
else
  echo "Elixir already installed"
fi

if ! [ -x "$(command -v kiex)" ]; then
  \curl -sSL https://raw.githubusercontent.com/taylor/kiex/master/install | bash -s
  echo 'test -s "$HOME/.kiex/scripts/kiex" && source "$HOME/.kiex/scripts/kiex"' >> ~/.zshrc
else
  echo "kiex already installed"
fi

echo "...done"
echo
