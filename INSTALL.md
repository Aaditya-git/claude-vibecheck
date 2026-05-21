# Installation

## Requirements

- Claude Code (any version)

## Install

Option 1: copy (static snapshot)
```bash
cp -r skill/ ~/.claude/skills/vibecheck/
```

Option 2: symlink (picks up updates automatically)
```bash
ln -s "$(pwd)/skill" ~/.claude/skills/vibecheck
```

Restart Claude Code after installing.

## Uninstall

```bash
rm -rf ~/.claude/skills/vibecheck
```
