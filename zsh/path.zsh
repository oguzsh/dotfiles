# Add directories to PATH without duplicates
add_to_path() {
  if [[ -d "$1" ]] && [[ ":$PATH:" != *":$1:"* ]]; then
    export PATH="$1:$PATH"
  fi
}

# Node
add_to_path "$HOME/.node/bin"

# User specified paths
add_to_path "$HOME/.local/bin"

# System wide
add_to_path "/usr/local/bin"

# Python
add_to_path "$HOME/.venv/bin"

