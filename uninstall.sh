#!/bin/bash

# Bash script for uninstalling GPIO modules and CLI script
#
# @author const39

CLI=gpio-modules
CLI_INSTALL_DIR=$HOME/.local/bin

MODULES_INSTALL_DIR=$HOME/.gpio

AUTOSTART_DESKTOP=$HOME/.config/autostart/gpio-modules.desktop

AUTOCOMPLETE_FINAL_NAME=gpio-modules
AUTOCOMPLETE_INSTALL_DIR=/usr/share/bash-completion/completions

# Removing modules from the destination directory
rm -r $MODULES_INSTALL_DIR 

if [[ "$?" == 0 ]]; then
    echo "Modules successfully removed."
else 
    echo "Error: Modules cannot be removed."
fi

# Removing autoscript desktop file from the destination directory
rm $AUTOSTART_DESKTOP 

if [[ "$?" == 0 ]]; then
    echo "Autostart successfully removed."
else 
    echo "Error: Autostart cannot be removed."
fi

# Removing CLI script
rm $CLI_INSTALL_DIR/$CLI

if [[ "$?" == 0 ]]; then
    echo "CLI script successfully removed."
else 
    echo "Error: CLI script cannot be removed."
fi

# Removing autocomplete script
sudo rm $AUTOCOMPLETE_INSTALL_DIR/$AUTOCOMPLETE_FINAL_NAME

if [[ "$?" == 0 ]]; then
    echo "Autocomplete script successfully removed."
else 
    echo "Error: Autocomplete script cannot be removed."
fi