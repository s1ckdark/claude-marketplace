#!/bin/bash

# Claude Code Plugin Creator
# Usage: ./scripts/create-plugin.sh <plugin-name>

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"
PLUGINS_DIR="$ROOT_DIR/plugins"
MARKETPLACE_FILE="$ROOT_DIR/.claude-plugin/marketplace.json"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check arguments
if [ -z "$1" ]; then
    echo -e "${RED}Error: Plugin name is required${NC}"
    echo "Usage: $0 <plugin-name>"
    exit 1
fi

PLUGIN_NAME="$1"
PLUGIN_DIR="$PLUGINS_DIR/$PLUGIN_NAME"

# Check if plugin already exists
if [ -d "$PLUGIN_DIR" ]; then
    echo -e "${RED}Error: Plugin '$PLUGIN_NAME' already exists${NC}"
    exit 1
fi

echo -e "${GREEN}Creating plugin: $PLUGIN_NAME${NC}"

# Create plugin directory structure
mkdir -p "$PLUGIN_DIR"/{commands,agents,hooks,templates}

# Create plugin.json
cat > "$PLUGIN_DIR/plugin.json" << EOF
{
  "name": "$PLUGIN_NAME",
  "version": "1.0.0",
  "description": "Description of $PLUGIN_NAME",
  "author": "dave",
  "commands": [],
  "agents": [],
  "hooks": [],
  "settings": {}
}
EOF

# Create README.md
cat > "$PLUGIN_DIR/README.md" << EOF
# $PLUGIN_NAME

Plugin description here.

## Installation

\`\`\`bash
/plugin install $PLUGIN_NAME@dave-cc-plugins --scope project
\`\`\`

## Commands

(List your commands here)

## Usage

(Describe how to use this plugin)
EOF

# Create sample command
cat > "$PLUGIN_DIR/commands/example.md" << EOF
---
name: example
description: Example command for $PLUGIN_NAME
---

This is an example command. Replace this with your actual command.

## Usage

/$PLUGIN_NAME:example

## Behavior

Describe what this command does.
EOF

echo -e "${GREEN}Created plugin structure at: $PLUGIN_DIR${NC}"

# Update marketplace.json
if [ -f "$MARKETPLACE_FILE" ]; then
    echo -e "${YELLOW}Updating marketplace.json...${NC}"

    # Create a temporary file with the new plugin entry
    TEMP_FILE=$(mktemp)

    # Use jq to add the new plugin
    if command -v jq &> /dev/null; then
        jq --arg name "$PLUGIN_NAME" \
           --arg source "./plugins/$PLUGIN_NAME" \
           '.plugins += [{
             "name": $name,
             "source": $source,
             "description": "Description of " + $name,
             "version": "1.0.0",
             "author": {"name": "dave"},
             "keywords": [],
             "category": "utility"
           }]' "$MARKETPLACE_FILE" > "$TEMP_FILE" && mv "$TEMP_FILE" "$MARKETPLACE_FILE"
        echo -e "${GREEN}Updated marketplace.json${NC}"
    else
        echo -e "${YELLOW}Warning: jq not found. Please manually add plugin to marketplace.json${NC}"
        echo ""
        echo "Add this to .claude-plugin/marketplace.json plugins array:"
        echo ""
        cat << EOF
    {
      "name": "$PLUGIN_NAME",
      "source": "./plugins/$PLUGIN_NAME",
      "description": "Description of $PLUGIN_NAME",
      "version": "1.0.0",
      "author": {"name": "dave"},
      "keywords": [],
      "category": "utility"
    }
EOF
    fi
fi

echo ""
echo -e "${GREEN}Plugin '$PLUGIN_NAME' created successfully!${NC}"
echo ""
echo "Next steps:"
echo "  1. Edit plugins/$PLUGIN_NAME/plugin.json"
echo "  2. Add commands to plugins/$PLUGIN_NAME/commands/"
echo "  3. Update .claude-plugin/marketplace.json description"
echo "  4. Commit and push changes"
