# shortcuts.plugin.zsh

# Define the file to store shortcuts
SHORTCUTS_FILE="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/shortcuts/shortcuts.zsh"

# Ensure the shortcuts file exists
if [[ ! -f "$SHORTCUTS_FILE" ]]; then
    touch "$SHORTCUTS_FILE"
fi

# Helper function to display the usage guide
display_help() {
  echo "Usage: shortcut [OPTION] [ALIAS] [COMMAND]"
  echo "Manage command shortcuts."
  echo "Options:"
  echo "  -h              display this help and exit"
  echo "  -a <alias> <command>  add a new shortcut"
  echo "  -r <alias>      remove a shortcut"
  echo "  -l              list all shortcuts"
  echo "  -e <alias> <command>  edit an existing shortcut"
}

# Function to add a new shortcut
add_shortcut() {
  if grep -q "^alias $1=" "$SHORTCUTS_FILE"; then
    echo "Shortcut '$1' already exists."
  else
    echo "alias $1='$2'" >> "$SHORTCUTS_FILE"
    echo "Shortcut $1 added."
    source "$SHORTCUTS_FILE" || echo "Failed to reload shortcuts."
  fi
}

# Function to remove an existing shortcut
remove_shortcut() {
  if grep -q "^alias $1=" "$SHORTCUTS_FILE"; then
    # Handle macOS sed syntax
    if [[ "$OSTYPE" == "darwin"* ]]; then
      sed -i '' "/^alias $1=/d" "$SHORTCUTS_FILE"
    else
      sed -i "/^alias $1=/d" "$SHORTCUTS_FILE"
    fi
    echo "Shortcut $1 removed."
    source "$SHORTCUTS_FILE" || echo "Failed to reload shortcuts."
  else
    echo "Shortcut '$1' does not exist."
  fi
}

# Function to list all shortcuts
list_shortcuts() {
  echo "Shortcuts available:"
  grep "^alias " "$SHORTCUTS_FILE"
}

# Function to edit an existing shortcut
edit_shortcut() {
  if grep -q "^alias $1=" "$SHORTCUTS_FILE"; then
    # Handle macOS sed syntax
    if [[ "$OSTYPE" == "darwin"* ]]; then
      sed -i '' "/^alias $1=/c\alias $1='$2'" "$SHORTCUTS_FILE"
    else
      sed -i "/^alias $1=/c\alias $1='$2'" "$SHORTCUTS_FILE"
    fi
    echo "Shortcut $1 updated."
    source "$SHORTCUTS_FILE" || echo "Failed to reload shortcuts."
  else
    echo "Shortcut '$1' does not exist. Use -a to add it."
  fi
}

# Parse command-line arguments to execute the appropriate function
case "$1" in
  -h)
    display_help
    ;;
  -a)
    shift # Remove the first argument (-a) to pass the rest to add_shortcut
    add_shortcut "$@"
    ;;
  -r)
    shift # Remove the first argument (-r) to pass the rest to remove_shortcut
    remove_shortcut "$@"
    ;;
  -l)
    list_shortcuts
    ;;
  -e)
    shift # Remove the first argument (-e) to pass the rest to edit_shortcut
    edit_shortcut "$@"
    ;;
  *)
    echo "Invalid option. Use -h for help."
    ;;
esac