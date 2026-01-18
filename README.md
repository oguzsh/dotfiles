# .dotfiles

Personal dotfiles for macOS/Linux/WSL.

## Quick Start

```sh
# Clone to home directory
git clone https://github.com/oguzsh/.dotfiles.git ~/.dotfiles

# Run bootstrap
cd ~/.dotfiles
chmod +x bootstrap.sh
./bootstrap.sh
```

## What's Included

| Component              | Description                                              |
| ---------------------- | -------------------------------------------------------- |
| **Brewfile**           | Core tools (node, fzf, gh, tmux, neovim, eza, ruff, etc) |
| **Brewfile.languages** | Ruby, Python, Rust                                       |
| **zsh/**               | Zinit + Oh-My-Posh, aliases, PATH, custom exports        |
| **oh-my-posh/**        | Custom prompt theme                                      |
| **tmux/**              | Tmux config with Catppuccin + vim-tmux-navigator         |
| **ghostty/**           | Terminal config + keybindings                            |
| **git/**               | Git config + global gitignore                            |
| **nvim/**              | LazyVim configuration                                    |
| **ssh/**               | SSH key generator for GitHub                             |
| **vscode/**            | VS Code settings                                         |
| **.claude/**           | Claude Code settings + file suggestion script            |

## SSH Setup

```sh
# Generate SSH key for GitHub
./ssh/ssh.sh your@email.com

# Copy public key
pbcopy < ~/.ssh/id_ed25519.pub
```

## Key Aliases

| Alias         | Command                           |
| ------------- | --------------------------------- |
| `nfresh`      | Remove node_modules and reinstall |
| `reloadshell` | Reload zsh config                 |
| `ll` / `la`   | List files with eza + icons       |
| `vim`         | Neovim                            |
| `rc` / `rs`   | Rails console / server            |

## Zsh Plugins (via Zinit)

- zsh-syntax-highlighting
- zsh-completions
- zsh-autosuggestions
- fzf-tab
- OMZP::git, aws, python, rust, ruby, rails
