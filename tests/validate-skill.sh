#!/bin/bash
# Validates that skill/vibecheck.md has required frontmatter fields

SKILL_FILE="skill/vibecheck.md"

if [ ! -f "$SKILL_FILE" ]; then
  echo "ERROR: $SKILL_FILE not found"
  exit 1
fi

# Check for frontmatter delimiters
if ! head -1 "$SKILL_FILE" | grep -q "^---$"; then
  echo "ERROR: Missing opening frontmatter delimiter"
  exit 1
fi

# Check required fields
for field in "name:" "description:"; do
  if ! grep -q "^$field" "$SKILL_FILE"; then
    echo "ERROR: Missing required frontmatter field: $field"
    exit 1
  fi
done

echo "OK: skill frontmatter valid"
