# This script is used to install dots and config files.
# It deletes existing config folders from ~/.config. Copies new config folders
# from $REPO-LOCATION/dotfiles/config to ~/.config, and overwrites dots in the 
# home directory with the ones from the repo, excluding certain files.
# The progress of the installation is logged in the 'install_progress.log' file.

# Features: 
# Test         Test backup, install, save functionalities. Nothing will be changed.
# Backup       All matching user dots and configs backed up to $HOME/bak-dot.
# Install      Install dots and configs to your home directory.
# Save         Copy all matching user dots and configs to the repo.

#!/bin/bash

# INIT VARIABLES
log_file=install_progress.log
NOW=$(date +"%Z # %m-%d-%Y @ %H:%M:%S")

BAK_DIR="$HOME/bak-dot"
BAK_CONFIG_DIR="$BAK_DIR/config"

USR_CONFIG_DIR="$HOME/.config"

getFolderNames() {
    folder_names=()
    for folder in $1; do
        if [ -d "$folder" ]; then
            folder_name=$(basename "$folder")
            folder_names+=("$folder_name")
        fi
    done
    echo -e "${folder_names[@]}"
}

getFileNames() {
    file_names=()
    for file in $1; do
        if [ -f "$file" ]; then
            file_name=$(basename "$file")
            file_names+=("$file_name")
        fi
    done
    echo -e "${file_names[@]}"
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
        echo -e "bak | $folder_path\t to \t$BAK_CONFIG_DIR/$folder"
        [[ ! ${1} ]] && cp -r "$folder_path" "$BAK_CONFIG_DIR"
    done
    for files in "${REPO_DOT_FILES[@]}"; do
        file_path="$HOME/$files"
        echo -e "bak | $file_path\t to \t$BAK_DIR/$files"
        [[ ! ${1} ]] && cp -r "$file_path" "$BAK_DIR"
    done
    echo -e "--- --- ---"
}

# Backup all configs and dots to the repo
saveToRepo () {
    for folder in "${REPO_CONFIG_FOLDERS[@]}"; do
        folder_path="$USR_CONFIG_DIR/$folder"
        echo -e "cp | $folder_path\t to \t$REPO_CONFIG_DIR/$folder"
        [[ ! ${1} ]] && cp -r "$folder_path" "$REPO_CONFIG_DIR"

    done
    for files in "${REPO_DOT_FILES[@]}"; do
        file_path="$HOME/$files"
        echo -e "cp | $file_path\t to \t$REPO_DOT_DIR/$files"
        [[ ! ${1} ]] && cp -r "$file_path" "$REPO_DOT_DIR"
    done
    echo -e "--- --- ---"
}

# Delete folders
deleteFolders () {
    for folder in "${REPO_CONFIG_FOLDERS[@]}"; do
        folder_path="$USR_CONFIG_DIR/$folder"
        if [ -d "$folder_path" ]; then
            echo -e "rm | $folder_path"
            [[ ! ${1} ]] && rm -rf "$folder_path"
        fi
    done
    echo -e "--- --- ---"
}

# Copy folders
copyFolders () {
    for folder in "${REPO_CONFIG_FOLDERS[@]}"; do
        echo -e "cp | $REPO_CONFIG_DIR/$folder\t to \t$USR_CONFIG_DIR"
        [[ ! ${1} ]] && cp -r "$REPO_CONFIG_DIR/$folder" "$USR_CONFIG_DIR"
    done
}

# Copy dots
overwriteConfigFiles () {
    for file in "${REPO_DOT_FILES[@]}"; do
        echo -e "cp | $REPO_DOT_DIR/$file\t to \t$HOME/$file"
        [[ ! ${1} ]] && cp -r "$REPO_DOT_DIR/$file" "$HOME/$file"
    done
    echo -e "--- --- ---"
}

# OPTION WRAPPER DECOR FUNCTIONS
fullInstall () {
    echo -e "Dotfile installation started\n$NOW\n"
    echo -e "--- --- ---"
    createBackup
    deleteFolders
    copyFolders
    overwriteConfigFiles
    echo -e "\nDotfile installation COMPLETE\n$NOW\nFind your backup in $BAK_DIR"
}

fullInstallTest () {
    echo -e "START TEST RUN - NOTHING WILL BE CHANGED"
    echo -e "DUMMY FULL INSTALL\n$NOW\n"
    echo -e "--- --- ---"
    createBackup $1
    deleteFolders $1
    copyFolders $1
    overwriteConfigFiles $1
    echo -e "\nDotfile installation COMPLETE\n$NOW\nFind your backup in $BAK_DIR"
    echo -e "\nDUMMY SAVE TO REPO\n$NOW\n"
    saveToRepo $1
    echo -e "END TEST RUN"
}

onlyBackup () {
    echo -e "Backup started\n$NOW\n"
    echo -e "--- --- ---"
    createBackup
    echo -e "\nBackup COMPLETE\n$NOW\nFind your backup in $BAK_DIR"
}

saveToRepoOption () {
    echo -e "Save to repo started\n$NOW\n"
    echo -e "--- --- ---"
    saveToRepo
    echo -e "\nSave to repo COMPLETE\n$NOW\nYour files in $REPO_DIR are now updated."
}


while true; do
echo -e "configs: \t ${REPO_CONFIG_FOLDERS[@]}
dots: \t\t ${REPO_DOT_FILES[@]}
Note: only files and folders listed in the repo will be backed up!\n"

echo -e "Select an option from below:
    1 Test:\t Test backup, install, save functionalities. Nothing will be changed.
    2 Backup:\t All matching user dots and configs backed up to $HOME/bak-dot.
    3 Install:\t Install dots and configs to your home directory.
    4 Save:\t Copy all matching user dots and configs to the repo.
    5 Exit:\t Well... it will exit...\n"

read -p "Enter option number > "

if [[ $REPLY =~ ^[0-6]$ ]]; then
    case $REPLY in
        1 )
            echo -e "\n"
            fullInstallTest 'test';
            echo -e "\n"
            ;;
        2 ) 
            echo -e "\n"
            onlyBackup;
            onlyBackup >> $log_file
            echo -e "\n"
            ;;
        3 ) 
            echo -e "\n"
            fullInstall;
            fullInstall >> $log_file  
            echo -e "\n"          
            ;;
        4)
            echo -e "\n"
            saveToRepoOption
            saveToRepoOption >> $log_file
            echo -e "\n"
            ;;
        5 ) break;;
        0 ) break;;
    esac
fi
done