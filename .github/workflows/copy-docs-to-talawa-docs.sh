#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Define variables
DOCS_SOURCE_DIR="./talawa-api-docs"  # Adjust this path
DOCS_REPO="https://github.com/gautam-divyanshu/talawa-docs.git"  # Replace with your org/repo
DOCS_REPO_DIR="docs/talawa-api-docs"

# Clone the talawa-docs repository
git clone $DOCS_REPO $DOCS_REPO_DIR
cd $DOCS_REPO_DIR

# Copy the generated docs to the talawa-docs repository
cp -r $DOCS_SOURCE_DIR/* ./talawa-api-docs/  # Adjust the destination path as needed

# Configure git
git config --global user.name "github-actions[bot]"
git config --global user.email "github-actions[bot]@users.noreply.github.com"

# Add, commit, and push changes
git add .
if git commit -m "Update documentation from talawa-api"; then
    git push origin develop # Replace 'main' with the appropriate branch
else
    echo "No changes to commit"
fi
