# In utils/manage_shortcuts.zsh

function add_shortcut() {
    if grep -q "^alias $1=" "$SHORTCUTS_FILE"; then
        echo "Shortcut '$1' already exists."
        return 1
    fi
    echo "alias $1='$2'" >> "$SHORTCUTS_FILE"
    echo "Shortcut $1 added."
}

function remove_shortcut() {
    if ! grep -q "^alias $1=" "$SHORTCUTS_FILE"; then
        echo "Shortcut '$1' does not exist."
        return 1
    fi
    sed -i "" "/^alias $1=/d" "$SHORTCUTS_FILE"
    echo "Shortcut $1 removed."
}

function edit_shortcut() {
    if ! grep -q "^alias $1=" "$SHORTCUTS_FILE"; then
        echo "Shortcut '$1' does not exist. Use -a to add it."
        return 1
    fi
    sed -i "" "/^alias $1=/c\alias $1='$2'" "$SHORTCUTS_FILE"
    echo "Shortcut $1 updated."
}

function list_shortcuts() {
    echo "Shortcuts available:"
    grep "^alias " "$SHORTCUTS_FILE"
}