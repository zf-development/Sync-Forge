#!/bin/bash
# Script to bump version in gradle.properties and update CHANGELOG.md

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Get current version from gradle.properties
CURRENT_VERSION=$(grep "mod_version=" gradle.properties | cut -d'=' -f2)
echo -e "${YELLOW}Current version: ${CURRENT_VERSION}${NC}"

# Ask for new version
read -p "Enter new version (current: ${CURRENT_VERSION}): " NEW_VERSION

if [ -z "$NEW_VERSION" ]; then
    echo -e "${RED}Version cannot be empty!${NC}"
    exit 1
fi

# Validate version format (semantic versioning)
if ! [[ "$NEW_VERSION" =~ ^[0-9]+\.[0-9]+\.[0-9]+(-[a-zA-Z0-9]+)?$ ]]; then
    echo -e "${RED}Invalid version format! Use semantic versioning (e.g., 1.2.3 or 1.2.3-beta)${NC}"
    exit 1
fi

# Update gradle.properties
echo -e "${YELLOW}Updating gradle.properties...${NC}"
sed -i.bak "s/mod_version=.*/mod_version=${NEW_VERSION}/" gradle.properties
rm gradle.properties.bak

# Update mods.toml version
echo -e "${YELLOW}Updating mods.toml...${NC}"
sed -i.bak "s/version=\".*\"/version=\"${NEW_VERSION}\"/" src/main/resources/META-INF/mods.toml
rm src/main/resources/META-INF/mods.toml.bak

# Update CHANGELOG.md
echo -e "${YELLOW}Updating CHANGELOG.md...${NC}"
TODAY=$(date +%Y-%m-%d)
sed -i.bak "s/## \[Unreleased\]/## \[Unreleased\]\n\n## \[${NEW_VERSION}\] - ${TODAY}/" CHANGELOG.md
rm CHANGELOG.md.bak

echo -e "${GREEN}Version bumped successfully to ${NEW_VERSION}!${NC}"
echo -e "${YELLOW}Don't forget to:${NC}"
echo -e "  1. Update CHANGELOG.md with your changes"
echo -e "  2. Commit the changes"
echo -e "  3. Create a git tag: git tag v${NEW_VERSION}"
echo -e "  4. Push with tags: git push origin main --tags"
