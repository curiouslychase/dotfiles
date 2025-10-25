# AGENTS.md

## Build/Lint/Test Commands
This is a dotfiles repository for configuration management, not a software project. No build, lint, or test commands exist.

## Architecture & Codebase Structure
- **Purpose**: Personal dotfiles and configuration files for macOS/Linux development environment
- **Structure**: Organized by tool/application (nvim/, zsh/, vscode/, tmux/, etc.)
- **Management**: Symlinks managed via Makefile (run `make init` to set up)
- **Dependencies**: Managed via Brewfile (run `brew bundle` to install)
- **Key Directories**:
  - `nvim/`: Neovim configuration with Lua plugins
  - `zsh/`: Zsh shell configuration and plugins
  - `vscode/`: VS Code/Cursor editor settings and keybindings
  - `scripts/`: Utility scripts (e.g., claude-mv for moving project contexts)

## Code Style Guidelines
- **Lua**: 2-space indentation, auto-prefer double quotes (stylua via .stylua.toml)
- **JavaScript/TypeScript**: Prettier formatting, ESLint for linting
- **General**: Trim trailing whitespace, LF line endings, final newline (per .editorconfig)
- **VS Code Settings**: Format on save enabled, 120 char ruler, tabs disabled
- **Naming**: Standard conventions per language (camelCase for JS, snake_case for Lua)
