# This script is used to install dotfiles and config files.
# It deletes existing config folders from $HOME/.config, copies new config folders from $HOME/dotfiles/.config to $HOME/.config,
# and overwrites dotfiles in the home directory with the ones from $HOME/dotfiles, excluding certain files.
# The progress of the installation is logged in the 'install_progress_log.txt' file.

#!/bin/bash

# Initialize
BAK_DIR="$HOME/bak-dot/"
BAK_CONFIG_DIR="$HOME/bak-dot/.config"

DOTFILES_DIR="$HOME/dotfiles"
CONFIG_DIR="$HOME/.config"

CONFIG_FOLDERS=("bash" "mc" "nvim")
CONFIG_FILES=(".tmux.conf" ".wezterm.lua" ".zsh_plugins.txt" ".zshrc")

log_file=install_progress.log
NOW=$(date +"%Z # %m-%d-%Y @ %H:%M:%S")


# Create a backup of folders from $HOME/bak
createBackup () {
    if [ ! -d "$BAK_DIR" ]; then
    echo "mkdir"
        mkdir "$BAK_DIR"
    fi

    for folder in "${CONFIG_FOLDERS[@]}"; do
        folder_path="$CONFIG_DIR/$folder"
        echo "backup .config/$folder to /bak-dot/$folder"
        cp -r "$folder_path" "$BAK_CONFIG_DIR"
    done
    for files in "${CONFIG_FILES[@]}"; do
        file_path="$HOME/$files"
        echo "backup $files to /bak-dot/$files"
        cp -r "$file_path" "$BAK_DIR"
    done
}

# Delete folders from $HOME/dotfiles/.config
deleteFolders () {
    for folder in "${CONFIG_FOLDERS[@]}"; do
        folder_path="$CONFIG_DIR/$folder"
        if [ -d "$folder_path" ]; then
            echo "rm - config: .config/$folder"
            rm -rf "$folder_path"
        fi
    done
}

# Copy folders from $HOME/dotfiles/.config to $HOME/.config
copyFolders () {
    for folder in "${CONFIG_FOLDERS[@]}"; do
        folder_path="$DOTFILES_DIR/.config/$folder"
        echo "cp - config: .config/$folder"
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
            echo "cp - dotfile $filename"
            cp -r "$file" "$HOME/$filename"
        fi
    done
}

# Clould not hold myself back from making the output pretty :)
makeItPretty () {
    echo "Dotfile installation started\n$NOW"
    echo "--- --- ---"

    echo "Creating backup of existing dotfiles and config folders..."
    createBackup
    echo "--- --- ---"

    echo "DELETE existing config"W
    deleteFolders
    echo "--- --- ---"

    echo "COPY new config folders"
    copyFolders
    echo "--- --- ---"

    echo "OVERWRITE dotfiles in home"
    overwriteConfigFiles
    echo "--- --- ---"

    echo "Dotfile installation complete\n$NOW"
}

makeItPretty >> $log_file
makeItPretty