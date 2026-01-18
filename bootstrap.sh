#!/bin/sh

echo "Setting up your system...."

# Detect OS
OS="$(uname -s)"
echo "Detected OS: $OS"

if [ ! -d "$HOME/.config" ]; then
  mkdir -p $HOME/.config
fi

# Install Homebrew if not exists
if ! command -v brew &> /dev/null; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  # macOS uses /opt/homebrew, Linux uses /home/linuxbrew
  if [ "$OS" = "Darwin" ]; then
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
  else
    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> $HOME/.zprofile
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  fi
fi

# Update Homebrew
echo "Updating Homebrew..."
brew update

# Install from Brewfile
echo "Installing packages from Brewfile..."
brew bundle --file=./Brewfile

# Install languages
echo "Installing programming languages..."
brew bundle --file=./Brewfile.languages

# Install Bun
if ! command -v bun &> /dev/null; then
  echo "Installing Bun..."
  curl -fsSL https://bun.com/install | bash
fi

# Remove existing .zshrc and symlink
echo "Setting up symlinks..."
rm -rf $HOME/.zshrc
ln -sf $HOME/.dotfiles/zsh/.zshrc $HOME/.zshrc

# Download Zinit, if it's not there yet
if [ ! -f "$HOME/.local/share/zinit/zinit.git/zinit.zsh" ]; then
  echo "Installing Zinit..."
  mkdir -p "$HOME/.local/share/zinit"
  git clone https://github.com/zdharma-continuum/zinit.git "$HOME/.local/share/zinit/zinit.git"
fi

rm -rf $HOME/.zprofile
ln -sf $HOME/.dotfiles/zsh/.zprofile $HOME/.zprofile

# Git
rm -rf $HOME/.gitconfig
ln -sf $HOME/.dotfiles/git/.gitconfig $HOME/.gitconfig

rm -rf $HOME/.gitignore_global
ln -sf $HOME/.dotfiles/git/.gitignore_global $HOME/.gitignore_global

# Oh-My-Posh
mkdir -p $HOME/.config/oh-my-posh
ln -sf $HOME/.dotfiles/oh-my-posh/theme.omp.json $HOME/.config/oh-my-posh/theme.omp.json

# Ghostty (macOS only)
if [ "$OS" = "Darwin" ]; then
  rm -rf $HOME/.config/ghostty
  ln -sf $HOME/.dotfiles/ghostty $HOME/.config/ghostty
fi

# Neovim
rm -rf $HOME/.config/nvim
ln -sf $HOME/.dotfiles/nvim $HOME/.config/nvim

# Tmux
rm -rf $HOME/.config/tmux
ln -sf $HOME/.dotfiles/tmux $HOME/.config/tmux

# Install TPM
if [ -d "$HOME/.tmux/plugins/tpm" ]; then
  rm -rf $HOME/.tmux/plugins/tpm
fi
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Claude
rm -rf $HOME/.claude
ln -sf $HOME/.dotfiles/.claude $HOME/.claude

# Create workspace directory
mkdir -p $HOME/workspace

echo "Done! Restarting shell..."
exec zsh
