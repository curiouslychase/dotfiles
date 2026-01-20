#!/bin/bash
# Bootstrap script for Claude Code dotfiles
# Symlinks reusable config to ~/.claude

set -e

DOTFILES_CLAUDE="$(cd "$(dirname "$0")" && pwd)"
CLAUDE_HOME="$HOME/.claude"

# Create ~/.claude if it doesn't exist
mkdir -p "$CLAUDE_HOME"
mkdir -p "$CLAUDE_HOME/commands"
mkdir -p "$CLAUDE_HOME/skills"
mkdir -p "$CLAUDE_HOME/hooks"

# Symlink individual files/dirs (backup existing if not symlinks)
symlink() {
    local src="$1"
    local dest="$2"

    if [ -L "$dest" ]; then
        rm "$dest"
    elif [ -e "$dest" ]; then
        echo "Backing up existing $dest to $dest.bak"
        mv "$dest" "$dest.bak"
    fi

    ln -s "$src" "$dest"
    echo "Linked $src -> $dest"
}

# Core config files
symlink "$DOTFILES_CLAUDE/CLAUDE.md" "$CLAUDE_HOME/CLAUDE.md"
symlink "$DOTFILES_CLAUDE/mcp.json" "$CLAUDE_HOME/mcp.json"
symlink "$DOTFILES_CLAUDE/settings.json" "$CLAUDE_HOME/settings.json"

# Commands
symlink "$DOTFILES_CLAUDE/commands/tweet.md" "$CLAUDE_HOME/commands/tweet.md"

# Skills
symlink "$DOTFILES_CLAUDE/skills/article-coauthor.md" "$CLAUDE_HOME/skills/article-coauthor.md"
symlink "$DOTFILES_CLAUDE/skills/podcast-summary.md" "$CLAUDE_HOME/skills/podcast-summary.md"
symlink "$DOTFILES_CLAUDE/skills/code-review" "$CLAUDE_HOME/skills/code-review"

# Hooks
symlink "$DOTFILES_CLAUDE/hooks/tts.js" "$CLAUDE_HOME/hooks/tts.js"

echo "Claude dotfiles bootstrapped successfully!"
