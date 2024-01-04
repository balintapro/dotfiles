# This script is used to install dots and config files.

# Features: 
# Test         Test backup, install, save functionalities. Nothing will be changed.
# Backup       All matching user dots and configs backed up to $HOME/bak-dot.
# Install      Install dots and configs to your home directory.
# Save         Copy all matching user dots and configs to the repo.

#!/bin/bash

# INIT VARIABLES
log_file=install_progress.log
NOW=$(date +"%Z # %m-%d-%Y @ %H:%M:%S")
NOW_F=$(date +"%m-%d-%Y_%H-%M-%S")
BAK_DIR="$HOME/bak-dot_${NOW_F}"
BAK_CONFIG_DIR="$BAK_DIR/config"

USR_CONFIG_DIR="$HOME/.config"

# Reset
Nc='\033[0m'       # Text Reset

# Regular Colors
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White

getFolderNames() {
    folder_names=()
    for folder in $1; do
        if [ -d "$folder" ]; then
            folder_name=$(basename "$folder")
            folder_names+=("$folder_name")
        fi
    done
    echo "${folder_names[@]}"
}

getFileNames() {
    file_names=()
    for file in $1; do
        if [ -f "$file" ]; then
            file_name=$(basename "$file")
            file_names+=("$file_name")
        fi
    done
    echo "${file_names[@]}"
}

REPO_DIR="$PWD"
REPO_CONFIG_DIR="$REPO_DIR/config"
REPO_DOT_DIR="$REPO_DIR/dots"
REPO_CONFIG_FOLDERS=($(getFolderNames "$PWD/config/*"))
REPO_DOT_FILES=($(getFileNames "$PWD/dots/.*"))

#MAIN FUNCTIONS
# Create a backup of folders to $HOME/bak
createBackup () {
    if [ ! -d "$BAK_DIR" ]; then
        mkdir "$BAK_DIR"
    fi

    for folder in "${REPO_CONFIG_FOLDERS[@]}"; do
        folder_path="$USR_CONFIG_DIR/$folder"
        echo "bak | $folder_path\t to \t$BAK_CONFIG_DIR/$folder"
        [[ ! ${1} ]] && cp -r "$folder_path" "$BAK_CONFIG_DIR"
    done
    for files in "${REPO_DOT_FILES[@]}"; do
        file_path="$HOME/$files"
        echo "bak | $file_path\t to \t$BAK_DIR/$files"
        [[ ! ${1} ]] && cp -r "$file_path" "$BAK_DIR"
    done
    echo "--- --- ---"
}

# Backup all configs and dots to the repo
saveToRepo () {
    for folder in "${REPO_CONFIG_FOLDERS[@]}"; do
        folder_path="$USR_CONFIG_DIR/$folder"
        echo "cp | $folder_path\t to \t$REPO_CONFIG_DIR/$folder"
        [[ ! ${1} ]] && cp -r "$folder_path" "$REPO_CONFIG_DIR"

    done
    for files in "${REPO_DOT_FILES[@]}"; do
        file_path="$HOME/$files"
        echo "cp | $file_path\t to \t$REPO_DOT_DIR/$files"
        [[ ! ${1} ]] && cp -r "$file_path" "$REPO_DOT_DIR"
    done
    echo "--- --- ---"
}

# Delete folders
deleteFolders () {
    for folder in "${REPO_CONFIG_FOLDERS[@]}"; do
        folder_path="$USR_CONFIG_DIR/$folder"
        if [ -d "$folder_path" ]; then
            echo "rm | $folder_path"
            [[ ! ${1} ]] && rm -rf "$folder_path"
        fi
    done
    echo "--- --- ---"
}

# Copy folders
copyFolders () {
    for folder in "${REPO_CONFIG_FOLDERS[@]}"; do
        echo "cp | $REPO_CONFIG_DIR/$folder\t to \t$USR_CONFIG_DIR"
        [[ ! ${1} ]] && cp -r "$REPO_CONFIG_DIR/$folder" "$USR_CONFIG_DIR"
    done
}

# Copy dots
overwriteConfigFiles () {
    for file in "${REPO_DOT_FILES[@]}"; do
        echo "cp | $REPO_DOT_DIR/$file\t to \t$HOME/$file"
        [[ ! ${1} ]] && cp -r "$REPO_DOT_DIR/$file" "$HOME/$file"
    done
    echo "--- --- ---"
}

# OPTION WRAPPER DECOR FUNCTIONS
fullInstall () {
    echo "${Green}Dotfile installation started${Nc}\n$NOW\n"
    echo "${Cyan}Find your backup in $BAK_DIR${Nc}"
    echo "--- --- ---"
    createBackup
    deleteFolders
    copyFolders
    overwriteConfigFiles
    echo "${Red}\nDotfile installation COMPLETE${Nc}\n$NOW"
}

fullInstallTest () {
    echo "${Green}START TEST RUN${Nc} - NOTHING WILL BE CHANGED"
    echo "${Cyan}DUMMY FULL INSTALL${Nc}\n$NOW\n"
    echo "--- --- ---"
    createBackup $1
    deleteFolders $1
    copyFolders $1
    overwriteConfigFiles $1
    echo "\n${Red}Dotfile installation COMPLETE${Nc}\n$NOW\n${Cyan}Find your backup in $BAK_DIR${Nc}"
    echo "${Cyan}\nDUMMY SAVE TO REPO${Nc}\n$NOW\n"
    saveToRepo $1
    echo "${Red}END TEST RUN${Nc}"
}

onlyBackup () {
    echo "${Green}Backup started${Nc}\n$NOW\n"
    echo "--- --- ---"
    createBackup
    echo "${Red}\nBackup COMPLETE${Nc}\n$NOW\n${Cyan}Find your backup in $BAK_DIR${Nc}"
}

saveToRepoOption () {
    echo "${Green}Save to repo started${Nc}\n$NOW\n"
    echo "--- --- ---"
    saveToRepo
    echo "${Red}\nSave to repo COMPLETE${Nc}\n$NOW\nYour files in $REPO_DIR are now updated."
}


while true; do
echo "configs: \t ${Green}${REPO_CONFIG_FOLDERS[@]}${Nc}
dots: \t\t ${Green}${REPO_DOT_FILES[@]}${Nc}
Note: only files and folders listed in the repo will be backed up!\n"

echo "Select an option from below:
    1 ${Green}Test:${Nc}\t Test backup, install, save functionalities. Nothing will be changed.
    2 ${Green}Backup:${Nc}\t All matching user dots and configs backed up to $HOME/bak-dot.
    3 ${Green}Install:${Nc}\t Install dots and configs to your home directory.
    4 ${Green}Save:${Nc}\t Copy all matching user dots and configs to the repo.
    5 ${Red}Exit:${Nc}\t Well... it will exit...\n"

read -p "Enter option number > "

if [[ $REPLY =~ ^[0-6]$ ]]; then
    case $REPLY in
        1 )
            echo "\n"
            fullInstallTest 'test';
            echo "\n"
            ;;
        2 ) 
            echo "\n"
            onlyBackup;
            onlyBackup >> $log_file
            echo "\n"
            ;;
        3 ) 
            echo "\n"
            fullInstall;
            fullInstall >> $log_file  
            echo "\n"          
            ;;
        4)
            echo "\n"
            saveToRepoOption
            saveToRepoOption >> $log_file
            echo "\n"
            ;;
        5 ) break;;
        0 ) break;;
    esac
fi
done
