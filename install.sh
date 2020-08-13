#!/bin/bash

# Bash script for installing (locally) GPIO modules and CLI script
#
# @author const39

CLI=gpio-modules
CLI_INSTALL_DIR=$HOME/.local/bin

MODULES_DIR=./modules
TEMPLATES_DIR=./templates
MODULES_INSTALL_DIR=$HOME/.gpio

AUTOSTART_SCRIPT=autostart
AUTOSTART_DESKTOP=gpio-modules.desktop
AUTOSTART_DESKTOP_INSTALL_DIR=$HOME/.config/autostart

AUTOCOMPLETE_ORIGINAL_NAME=autocomplete
AUTOCOMPLETE_FINAL_NAME=gpio-modules
AUTOCOMPLETE_INSTALL_DIR=/usr/share/bash-completion/completions

# Copy modules and templates in the destination directory
mkdir -p $MODULES_INSTALL_DIR
cp -r $MODULES_DIR $MODULES_INSTALL_DIR 
cp -r $TEMPLATES_DIR $MODULES_INSTALL_DIR 

if [[ "$?" == 0 ]]; then
    echo "Modules successfully installed."
else 
    echo "Error: Modules cannot be installed."
fi

# Copy autostart script in the destination directory
cp $AUTOSTART_SCRIPT $MODULES_INSTALL_DIR 

# Set execute permissions on the autostart script
chmod +x $MODULES_INSTALL_DIR/$AUTOSTART_SCRIPT

mkdir -p $AUTOSTART_DESKTOP_INSTALL_DIR
cp $AUTOSTART_DESKTOP $AUTOSTART_DESKTOP_INSTALL_DIR 

if [[ "$?" == 0 ]]; then
    echo "Autostart successfully installed."
else 
    echo "Error: Autostart cannot be installed."
fi


# Copy CLI script
mkdir -p $CLI_INSTALL_DIR
cp ./$CLI $CLI_INSTALL_DIR/$CLI

if [[ "$?" == 0 ]]; then
    echo "CLI script successfully installed."
else 
    echo "Error: CLI script cannot be installed."
fi

# Set default permissions on the CLI script
chmod 755 $CLI_INSTALL_DIR/$CLI


# Copy and rename the autocomplete file
sudo cp ./$AUTOCOMPLETE_ORIGINAL_NAME $AUTOCOMPLETE_INSTALL_DIR/$AUTOCOMPLETE_FINAL_NAME

if [[ "$?" == 0 ]]; then
    echo "Autocomplete script successfully installed."
else 
    echo "Error: Autocomplete script cannot be installed."
fi

# Set permissions on the autocomplete script
sudo chmod 644 $AUTOCOMPLETE_INSTALL_DIR/$AUTOCOMPLETE_FINAL_NAME