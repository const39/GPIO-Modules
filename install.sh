#!/bin/bash

# Bash script for installing (locally) GPIO modules and CLI script
#
# @author Constantin FLEURY (const39)

CLI=gpio-modules
CLI_INSTALL_DIR=$HOME/.local/bin

MODULES_DIR=./modules
MODULES_INSTALL_DIR=$HOME/.gpio

AUTOCOMPLETE_ORIGINAL_NAME=autocomplete
AUTOCOMPLETE_FINAL_NAME=gpio-modules
AUTOCOMPLETE_INSTALL_DIR=/usr/share/bash-completion/completions

# Copy modules in the destination directory
mkdir -p $MODULES_INSTALL_DIR
cp -r $MODULES_DIR $MODULES_INSTALL_DIR 

if [[ "$?" == 0 ]]; then
    echo "Modules successfully installed."
else 
    echo "Error: Modules cannot be installed."
fi

# Copy CLI script
cp ./$CLI $CLI_INSTALL_DIR

if [[ "$?" == 0 ]]; then
    echo "CLI script successfully installed."
else 
    echo "Error: CLI script cannot be installed."
fi

# Set default permissions on the CLI script
chmod 755 $CLI_INSTALL_DIR/$CLI


# Copy and rename the autocomplete file
sudo cp ./$AUTOCOMPLETE_ORIGINAL_NAME $AUTOCOMPLETE_INSTALL_DIR
sudo mv $AUTOCOMPLETE_INSTALL_DIR/$AUTOCOMPLETE_ORIGINAL_NAME $AUTOCOMPLETE_INSTALL_DIR/$AUTOCOMPLETE_FINAL_NAME

if [[ "$?" == 0 ]]; then
    echo "Autocomplete script successfully installed."
else 
    echo "Error: Autocomplete script cannot be installed."
fi

# Set permissions on the autocomplete script
sudo chmod 644 $AUTOCOMPLETE_INSTALL_DIR/$AUTOCOMPLETE_FINAL_NAME