# GPIO Modules

## Features

-   Start and stop Python modules
-   List currently installed or running modules
-   Automatically start modules on boot
-   Create new modules from a template

TODO :

-   Remove a module

## Using GPIO-Modules

### Start or stop a module

```
gpio-modules {start|stop} {<module_name>|all}
```

where `module_name` is the name of the directory containing a Python script with the same name.

You can use `all` instead of the module name to start/stop all installed modules.

### List installed and running modules

```
gpio-modules {installed|running}
```

### Create a new module

```
gpio-modules create <module_name>
```

**Note:** The module name cannot contain spaces. Use underscores (\_) instead.

## Install

**All Python modules use the Python `gpiozero` library.**
While it is generally installed by default on Raspbian, you may not have it on your Raspberry. Be sure to check if it's installed before using the modules.

To install GPIO-Modules :

-   Clone this repository

```
git clone https://github.com/const39/GPIO-Modules.git
```

-   Execute the install script

```
./install.sh
```

**Note:** CLI and modules are installed in the user's home directory (`$HOME`)

## Uninstall

To remove GPIO-modules from your system, simply execute the uninstall script :

```
./uninstall.sh
```

## Included modules

-   `on_off_button` - Shutdown or wake up the Raspberry Pi when pressing the associated button.
-   `remote_scanner` - Send a scan request to the default scanner connected to the Raspberry Pi and save the file in the associated directory. **Require the `scanimage` package.**
