# shortcuts.plugin.zsh

# Define the file to store shortcuts
SHORTCUTS_FILE="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/shortcuts/shortcuts.zsh"

# Ensure the shortcuts file exists
if [[ ! -f "$SHORTCUTS_FILE" ]]; then
    touch "$SHORTCUTS_FILE"
fi

# Function to display the usage guide
function display_help() {
  echo "Usage: shortcuts [OPTION] [ALIAS] [COMMAND]"
  echo "Manage command shortcuts."
  echo "Options:"
  echo "  -h              display this help and exit"
  echo "  -a <alias> <command>  add a new shortcut"
  echo "  -r <alias>      remove a shortcut"
  echo "  -l              list all shortcuts"
  echo "  -e <alias> <command>  edit an existing shortcut"
}

# Function to add a new shortcut
function add_shortcut() {
  if grep -q "^alias $1=" "$SHORTCUTS_FILE"; then
    echo "Shortcut '$1' already exists."
  else
    echo "alias $1='$2'" >> "$SHORTCUTS_FILE"
    echo "Shortcut $1 added."
  fi
}

# Function to remove an existing shortcut
function remove_shortcut() {
  if grep -q "^alias $1=" "$SHORTCUTS_FILE"; then
    sed -i "/^alias $1=/d" "$SHORTCUTS_FILE"
    echo "Shortcut $1 removed."
  else
    echo "Shortcut '$1' does not exist."
  fi
}

# Function to list all shortcuts
function list_shortcuts() {
  echo "Shortcuts available:"
  grep "^alias " "$SHORTCUTS_FILE"
}

# Function to edit an existing shortcut
function edit_shortcut() {
  if grep -q "^alias $1=" "$SHORTCUTS_FILE"; then
    sed -i "/^alias $1=/c\alias $1='$2'" "$SHORTCUTS_FILE"
    echo "Shortcut $1 updated."
  else
    echo "Shortcut '$1' does not exist. Use -a to add it."
  fi
}

# Main function to manage shortcuts
function shortcuts() {
  case "$1" in
    -h) display_help ;;
    -a) shift; add_shortcut "$@"; source "$SHORTCUTS_FILE" ;;
    -r) shift; remove_shortcut "$@"; source "$SHORTCUTS_FILE" ;;
    -l) list_shortcuts ;;
    -e) shift; edit_shortcut "$@"; source "$SHORTCUTS_FILE" ;;
    *) echo "Invalid option. Use -h for help." ;;
  esac
}

# Load existing shortcuts
source "$SHORTCUTS_FILE"