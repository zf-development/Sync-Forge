#!/bin/bash
# Helper script to add entries to CHANGELOG.md

set -e

CHANGELOG="CHANGELOG.md"

# Check if CHANGELOG exists
if [ ! -f "$CHANGELOG" ]; then
    echo "CHANGELOG.md not found!"
    exit 1
fi

echo "What type of change is this?"
echo "1) Added"
echo "2) Changed"
echo "3) Fixed"
echo "4) Removed"
echo "5) Security"
read -p "Select (1-5): " change_type

case $change_type in
    1) TYPE="Added" ;;
    2) TYPE="Changed" ;;
    3) TYPE="Fixed" ;;
    4) TYPE="Removed" ;;
    5) TYPE="Security" ;;
    *) echo "Invalid option"; exit 1 ;;
esac

read -p "Enter description: " description

if [ -z "$description" ]; then
    echo "Description cannot be empty!"
    exit 1
fi

# Find the Unreleased section and add the entry
if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    sed -i '' "/## \[Unreleased\]/,/^## / {
        /^### $TYPE/ {
            a\\
- $description
            b
        }
        /^## \[Unreleased\]/ {
            a\\
\\
### $TYPE\\
- $description
            b
        }
    }" "$CHANGELOG"
else
    # Linux
    sed -i "/## \[Unreleased\]/,/^## / {
        /^### $TYPE/ {
            a\\
- $description
            b
        }
        /^## \[Unreleased\]/ {
            a\\
\\
### $TYPE\\
- $description
            b
        }
    }" "$CHANGELOG"
fi

echo "Entry added to CHANGELOG.md!"
