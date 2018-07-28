echo
echo "Installing elixir..."
if ! [ -x "$(command -v elixir)" ]; then
  brew update
  brew install elixir
else
  echo "Elixir already installed"
  echo "$(elixir --version)"
fi
echo "...done"
echo
