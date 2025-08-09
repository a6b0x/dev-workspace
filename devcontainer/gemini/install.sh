#!/bin/bash
set -e

echo "Installing Google Gemini CLI..."

# Ensure npm is available
if ! command -v npm &> /dev/null; then
    echo "Error: npm is not available. Please ensure Node.js is installed."
    exit 1
fi

# Clean and install
npm uninstall -g @google/gemini-cli || true
npm install -g @google/gemini-cli@latest

echo "Google Gemini CLI installation completed!"