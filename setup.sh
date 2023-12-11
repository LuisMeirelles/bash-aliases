#!/bin/bash

if [ -f ~/.bash_aliases ]; then
  if [ ! -d ~/.bash_aliases.d ]; then
    tput setaf 3
    echo "[i] ~/.bash_aliases already exists, creating ~/.bash_aliases.d directory..."
    tput sgr0

    mkdir ~/.bash_aliases.d

    tput setaf 2
    echo "[+] ~/.bash_aliases.d directory created successfully!"
    tput sgr0

    tput setaf 3
    echo "[i] Moving ~/.bash_aliases to ~/.bash_aliases.d..."
    tput sgr0

    mv ~/.bash_aliases ~/.bash_aliases.d/

    tput setaf 2
    echo "[+] ~/.bash_aliases moved successfully!"
    tput sgr0

    tput setaf 3
    echo "[i] Appending source_commands.sh to ~/.bash_aliases.d/.bash_aliases..."
    tput sgr0

    cat source_commands.sh >>~/.bash_aliases.d/.bash_aliases

    tput setaf 2
    echo "[+] ~/.bash_aliases.d/.bash_aliases appended successfully!"
    tput sgr0
  fi
fi

for file in *_alias.sh; do
  basename_file=$(basename "$file")

  if [ -f ~/.bash_aliases.d/"$basename_file" ]; then
    tput setaf 3
    echo "[i] File $basename_file already exists, skipping..."
    tput sgr0

    continue
  fi

  tput setaf 3
  echo "[i] Linking $file to ~/.bash_aliases.d/$basename_file..."
  tput sgr0

  ln -s "$(pwd)/$file" ~/.bash_aliases.d/"$file"

  tput setaf 2
  echo "[+] File $basename_file linked successfully!"
  tput sgr0
done

source "$HOME"/.bash_aliases.d/.bash_aliases
