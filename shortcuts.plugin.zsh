# shortcut.plugin.zsh

SHORTCUTS_FILE="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/shortcuts/shortcuts.zsh"

# Ensure shortcuts file exists
if [[ ! -f "$SHORTCUTS_FILE" ]]; then
    touch "$SHORTCUTS_FILE"
fi

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

add_shortcut() {
  if grep -q "^alias $1=" "$SHORTCUTS_FILE"; then
    echo "Shortcut '$1' already exists."
  else
    echo "alias $1='$2'" >> "$SHORTCUTS_FILE"
    echo "Shortcut $1 added."
    source "$SHORTCUTS_FILE"
    echo "Shortcut file reloaded successfully."
  fi
}

remove_shortcut() {
  if grep -q "^alias $1=" "$SHORTCUTS_FILE"; then
    sed -i "/^alias $1=/d" "$SHORTCUTS_FILE"
    echo "Shortcut $1 removed."
    source "$SHORTCUTS_FILE"
    echo "Shortcut file reloaded successfully."
  else
    echo "Shortcut '$1' does not exist."
  fi
}

list_shortcuts() {
  echo "Shortcuts available:"
  grep "^alias " "$SHORTCUTS_FILE"
}

edit_shortcut() {
  if grep -q "^alias $1=" "$SHORTCUTS_FILE"; then
    sed -i "/^alias $1=/c\alias $1='$2'" "$SHORTCUTS_FILE"
    echo "Shortcut $1 updated."
    source "$SHORTCUTS_FILE"
    echo "Shortcut file reloaded successfully."
  else
    echo "Shortcut '$1' does not exist. Use -a to add it."
  fi
}

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