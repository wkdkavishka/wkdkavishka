#!/bin/bash

# Function to log messages with timestamp
echo_log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1"
}

echo_log "Starting git update process"

echo_log "Copying README.md to ../wkdkavishka.github.io/"
cp README.md ../wkdkavishka.github.io/ && echo_log "Successfully copied README.md" || echo_log "Failed to copy README.md"

echo_log "Starting git operations"
git add . && echo_log "Successfully added files to git" || echo_log "Failed to add files"

git commit -m "auto deploy $(date '+%Y-%m-%d %H:%M:%S')" && echo_log "Successfully committed changes" || echo_log "Failed to commit changes"

git config --global pull.rebase true && echo_log "Set git pull rebase configuration" || echo_log "Failed to set git pull rebase configuration"

echo_log "Starting git pull operation"
git pull && echo_log "Successfully pulled changes" || echo_log "Failed to pull changes"

echo_log "Starting git push operation"
git push && echo_log "Successfully pushed changes" || echo_log "Failed to push changes"

echo_log "Git update process completed"
