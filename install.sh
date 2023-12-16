#!/bin/bash

# Initialize
DOTFILES_DIR="~/dotfiles"
CONFIG_DIR="~/.config"
log_file=~/install_progress_log.txt

# Function to delete folders from ~/.config
FOLDERS_TO_DELETE="bash|mc|nvim"

for folder in $FOLDERS_TO_DELETE; do
    folder_path="$CONFIG_DIR/$folder"
    if [ -d "$folder_path" ]; then
        rm -rf "$folder_path"
            echo "Deleted folder: $folder_path" >> $log_file
            echo "Deleted folder: $folder_path"
    fi
done

# Copy files
if [ ! -d "$CONFIG_DIR" ]; then
    mkdir "$CONFIG_DIR"
fi

# Copy files to the home directory
FILES_TO_EXCLUDE=".config|install.sh|readme.md|.gitignore|.git"

for file in "$DOTFILES_DIR"/*; do
    filename=$(basename "$file")
    if [[ "$filename" != "$FILES_TO_EXCLUDE" ]]; then
        echo "Copied: $file to ~/$filename" >> $log_file
        echo "Copied: $file to ~/$filename"
        cp -r "$file" "~/$filename"
    fi
done

echo "Dotfiles installation complete!"
