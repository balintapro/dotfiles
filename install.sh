#!/bin/bash

# Initialize
DOTFILES_DIR="$HOME/dotfiles"
CONFIG_DIR="$HOME/.config"
CONFIG_FOLDERS=("bash" "mc" "nvim")

log_file=install_progress_log.txt

# Delete folders from $HOME/dotfiles/.config
deleteFolders () {
    for folder in "${CONFIG_FOLDERS[@]}"; do
        folder_path="$CONFIG_DIR/$folder"
        if [ -d "$folder_path" ]; then
            echo "rm - config: $folder_path" >> $log_file
            echo "rm - config: $folder_path"
            rm -rf "$folder_path"
        fi
    done
}

# Copy folders from $HOME/dotfiles/.config to $HOME/.config
copyFolders () {
    for folder in "${CONFIG_FOLDERS[@]}"; do
        folder_path="$DOTFILES_DIR/.config/$folder"
        echo "cp - config: $folder_path" >> $log_file
        echo "cp - config: $folder_path"
        cp -r "$folder_path" "$CONFIG_DIR"
    done
}

# Copy dotfiles to the home directory
overwriteConfigFiles () {
    for file in "$DOTFILES_DIR"/.[!.]*; do
        filename=$(basename "$file")
        if [[ 
            "$filename" != ".config" && 
            "$filename" != "install.sh" && 
            "$filename" != "readme.md" && 
            "$filename" != ".gitignore" && 
            "$filename" != ".git" && 
            "$filename" != ".DS_Store" 
            ]]; then
            echo "$HOME/$filename" >> $log_file
            echo "cp - dotfile $HOME/$filename"
            cp -r "$file" "$HOME/$filename"
        fi
    done
}

deleteFolders
copyFolders
overwriteConfigFiles

echo "Dotfiles installation complete!"
