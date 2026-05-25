# Installation

## Requirements

- Claude Code (any version)

## Install via Claude Code (recommended)

```bash
claude plugins marketplace add github:Aaditya-git/claude-vibecheck
claude plugins install vibecheck
```

Restart Claude Code.

## Manual install (alternative)

```bash
git clone https://github.com/Aaditya-git/claude-vibecheck
cd claude-vibecheck

# Symlink (picks up updates automatically)
ln -s "$(pwd)/skills" ~/.claude/skills/vibecheck
```

Restart Claude Code after installing.

## Uninstall

```bash
# If installed via claude plugins
claude plugins uninstall vibecheck

# If installed manually
rm -rf ~/.claude/skills/vibecheck
```
