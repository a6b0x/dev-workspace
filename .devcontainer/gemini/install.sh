#!/bin/bash
set -e

echo "Checking Google Gemini CLI version..."

# Ensure npm is available
if ! command -v npm >/dev/null 2>&1; then
    echo "Error: npm not found. Please install Node.js first."
    exit 1
fi

# Fetch the latest version from the registry
LATEST=$(npm view @google/gemini-cli@latest version)

# Get currently installed version (empty if not installed)
CURRENT=$(npm list -g --depth=0 @google/gemini-cli 2>/dev/null | sed -n 's/.*@//p')

echo "Local version : ${CURRENT:-not installed}"
echo "Remote version: $LATEST"

# Skip installation if already up-to-date
if [[ "$CURRENT" == "$LATEST" ]]; then
    echo "Already on the latest version. Nothing to do."
else
    echo "Installing/updating to $LATEST ..."
    npm install -g @google/gemini-cli@latest
    echo "Installation completed."
fi