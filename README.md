# Development aliases for unix users

<!-- TOC -->
* [Development aliases for unix users](#development-aliases-for-unix-users)
  * [Process](#process)
  * [Aliases](#aliases)
    * [composer](#composer)
  * [Setup](#setup)
<!-- TOC -->

## Process

> Warning: the script modifies the structure of your distro's aliases as outlined below.

* If the `~/.bash_aliases` file exists and the `~/.bash_aliases.d/` directory doesn't exist
  * Create the directory `~/.bash_aliases.d/`
  * Move the file `~/.bash_aliases` into `~/.bash_aliases.d/` directory
  * Append the content of [source_commands.sh](source_commands.sh) to the `~/.bash_aliases.d/.bash_aliases` file
    * This piece of code has the responsibility of sourcing all aliases from this repository (all of these aliases end with `_alias.sh`)
* Loop through all alias files (those that end with "_alias.sh")
  * If the file already exists in `~/.bash_aliases.d/.bash_aliases`, skip to the next iteration
  * Otherwise, create a symbolic link between the file in current repository and `~/.bash_aliases.d/file_alias.sh`
* Sources `~/.bash_aliases.d/.bash_aliases` file, turning the new aliases available in current shell

## Aliases

### composer

If the current folder contains a service named 'composer' within the Docker Compose file, the alias uses it. If the service doesn't exist, the alias uses the original Docker Hub image, version 2

## Setup

To activate these aliases, execute `source setup.sh` in the terminal.