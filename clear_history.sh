#!/bin/bash

# Clear the shell history for the current session
echo "Clearing shell history..."
history -c  # Clear in-memory history
history -w  # Write the cleared (empty) history to the file

# Overwrite and remove Bash history file
echo "Overwriting ~/.bash_history (if exists)..."
> ~/.bash_history 2>/dev/null  # Empty the Bash history file (if it exists)

# Overwrite and remove Zsh history file
echo "Overwriting ~/.zsh_history (if exists)..."
> ~/.zsh_history 2>/dev/null  # Empty the Zsh history file (if it exists)

# Handle root's history files if the script is run as root
if [ "$EUID" -eq 0 ]; then
  echo "Overwriting /root/.bash_history..."
  > /root/.bash_history 2>/dev/null  # Empty root's Bash history file (if it exists)

  echo "Overwriting /root/.zsh_history..."
  > /root/.zsh_history 2>/dev/null  # Empty root's Zsh history file (if it exists)
fi

# Restart the shell to apply changes
echo "Restarting the shell to clear cached history..."
exec bash
