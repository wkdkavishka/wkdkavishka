#!/bin/bash

this=$(pwd)
TARGET_DIR="/mnt/Storage/projects/Personal projects/wkdkavishka.github.io/"

echo "[deploy] Checking if target directory exists..."
if [ ! -d "$TARGET_DIR" ]; then
    echo "[deploy][ERROR] Target directory '$TARGET_DIR' does not exist. Deployment aborted."
    exit 1
fi

echo "[deploy] Copying files to GitHub Pages repo..."
cp README.md "$TARGET_DIR"

cd "$TARGET_DIR" || {
    echo "[deploy][ERROR] Failed to cd into '$TARGET_DIR'"
    exit 1
}
echo "[deploy] Adding changes to git..."
git add .
echo "[deploy] Committing changes..."
git commit -m "auto deploy $(date '+%Y-%m-%d %H:%M:%S')"
git config --global pull.rebase true
echo "[deploy] Pulling latest changes..."
git pull
echo "[deploy] Pushing to GitHub..."
git push
echo "[deploy] Deployment complete."
