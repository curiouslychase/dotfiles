#!/bin/bash
set -e

# Usage: claude-mv <old_directory> <new_directory>

if [ $# -ne 2 ]; then
    echo "Usage: claude-mv <old_directory> <new_directory>"
    echo "Example: claude-mv ~/old-project ~/new-project"
    exit 1
fi

OLD_DIR="$1"
NEW_DIR="$2"

# Resolve old directory to absolute path
OLD_ABS=$(cd "$OLD_DIR" 2>/dev/null && pwd || echo "")

if [ -z "$OLD_ABS" ]; then
    echo "Error: Old directory does not exist: $OLD_DIR"
    exit 1
fi

# Check if new directory already exists
if [ -e "$NEW_DIR" ]; then
    echo "Error: New directory already exists: $NEW_DIR"
    exit 1
fi

# Convert paths to Claude's format (replace / and . with -)
# Need to do this BEFORE moving the directory to check for existing context
OLD_ENCODED=$(echo "$OLD_ABS" | sed 's/[\/.]/-/g')

# Figure out what the new absolute path will be
if [[ "$NEW_DIR" = /* ]]; then
    # NEW_DIR is already absolute
    NEW_ABS_FUTURE="$NEW_DIR"
else
    # NEW_DIR is relative, resolve it
    NEW_PARENT=$(dirname "$NEW_DIR")
    NEW_BASENAME=$(basename "$NEW_DIR")
    if [ "$NEW_PARENT" = "." ]; then
        NEW_ABS_FUTURE="$(pwd)/$NEW_BASENAME"
    else
        NEW_ABS_FUTURE="$(cd "$NEW_PARENT" 2>/dev/null && pwd)/$NEW_BASENAME"
    fi
fi

NEW_ENCODED=$(echo "$NEW_ABS_FUTURE" | sed 's/[\/.]/-/g')

CLAUDE_DIR="$HOME/.claude"

# Check if destination Claude context already exists BEFORE moving directory
EXISTING_CONTEXT=()
for subdir in projects file-history todos shell-snapshots debug; do
    NEW_PATH="$CLAUDE_DIR/$subdir/$NEW_ENCODED"
    if [ -d "$NEW_PATH" ] || [ -f "$NEW_PATH" ]; then
        EXISTING_CONTEXT+=("$subdir")
    fi
done

# If destination context exists, prompt user BEFORE moving anything
if [ ${#EXISTING_CONTEXT[@]} -gt 0 ]; then
    echo "Warning: Claude context already exists for $NEW_ABS_FUTURE:"
    for item in "${EXISTING_CONTEXT[@]}"; do
        COUNT=""
        if [ "$item" = "projects" ] && [ -d "$CLAUDE_DIR/$item/$NEW_ENCODED" ]; then
            SESSION_COUNT=$(ls -1 "$CLAUDE_DIR/$item/$NEW_ENCODED"/*.jsonl 2>/dev/null | wc -l | tr -d ' ')
            COUNT=" ($SESSION_COUNT sessions)"
        fi
        echo "  - $item$COUNT"
    done
    echo ""
    echo "Options:"
    echo "  [c] Clean out existing context and continue"
    echo "  [m] Merge old context into existing context"
    echo "  [n] Abort (default)"
    echo ""
    read -p "Choose [c/m/N]: " -n 1 -r
    echo

    if [[ $REPLY =~ ^[Cc]$ ]]; then
        echo "Cleaning out existing context for $NEW_ABS_FUTURE..."
        for item in "${EXISTING_CONTEXT[@]}"; do
            NEW_PATH="$CLAUDE_DIR/$item/$NEW_ENCODED"
            rm -rf "$NEW_PATH"
            echo "  ✓ Removed $item"
        done
        echo ""
    elif [[ $REPLY =~ ^[Mm]$ ]]; then
        echo "Will merge contexts..."
    else
        echo "Aborted."
        exit 1
    fi
fi

echo "Moving Claude context from:"
echo "  $OLD_ABS"
echo "  → $NEW_ABS_FUTURE"
echo ""

MOVED=0

# Rename/merge in each location if exists (BEFORE moving directory)
for subdir in projects file-history todos shell-snapshots debug; do
    OLD_PATH="$CLAUDE_DIR/$subdir/$OLD_ENCODED"
    NEW_PATH="$CLAUDE_DIR/$subdir/$NEW_ENCODED"

    if [ -d "$OLD_PATH" ]; then
        if [ -d "$NEW_PATH" ]; then
            # Merge: move all files from old to new
            echo "Merging $subdir/$OLD_ENCODED → $subdir/$NEW_ENCODED"
            mv "$OLD_PATH"/* "$NEW_PATH/" 2>/dev/null || true
            rmdir "$OLD_PATH" 2>/dev/null || rm -rf "$OLD_PATH"
        else
            # Simple rename
            echo "Moving $subdir/$OLD_ENCODED → $subdir/$NEW_ENCODED"
            mv "$OLD_PATH" "$NEW_PATH"
        fi
        MOVED=$((MOVED + 1))
    elif [ -f "$OLD_PATH" ]; then
        echo "Moving $subdir/$OLD_ENCODED → $subdir/$NEW_ENCODED"
        mv "$OLD_PATH" "$NEW_PATH"
        MOVED=$((MOVED + 1))
    fi
done

if [ $MOVED -eq 0 ]; then
    echo "No Claude context found for $OLD_ABS"
else
    echo "✓ Moved $MOVED context location(s)"
fi

echo ""

# Update session file contents to reference new path
if [ -d "$CLAUDE_DIR/projects/$NEW_ENCODED" ]; then
    SESSION_FILES=$(find "$CLAUDE_DIR/projects/$NEW_ENCODED" -name "*.jsonl" 2>/dev/null)
    if [ -n "$SESSION_FILES" ]; then
        echo "Updating session file references..."
        find "$CLAUDE_DIR/projects/$NEW_ENCODED" -name "*.jsonl" -exec sed -i '' "s|$OLD_ABS|$NEW_ABS_FUTURE|g" {} \;
        echo "✓ Updated session files"
        echo ""
    fi
fi

# Move the actual directory AFTER Claude context is moved
echo "Moving directory:"
echo "  $OLD_ABS"
echo "  → $NEW_DIR"
mv "$OLD_ABS" "$NEW_DIR"

# Resolve new directory to absolute path
NEW_ABS=$(cd "$NEW_DIR" 2>/dev/null && pwd)
echo "✓ Directory moved"
echo ""

# Update history.jsonl to reference new path
HISTORY_FILE="$CLAUDE_DIR/history.jsonl"
if [ -f "$HISTORY_FILE" ]; then
    echo ""
    echo "Updating history.jsonl references..."
    cp "$HISTORY_FILE" "$HISTORY_FILE.backup"
    sed -i '' "s|$OLD_ABS|$NEW_ABS|g" "$HISTORY_FILE"
    echo "✓ Updated history.jsonl (backup: history.jsonl.backup)"
fi
