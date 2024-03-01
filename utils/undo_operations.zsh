# In utils/undo_operations.zsh
function undo_last_operation() {
    if [[ -f "$UNDO_FILE" && -s "$UNDO_FILE" ]]; then
        cp "$UNDO_FILE" "$SHORTCUTS_FILE"
        echo "Last operation undone."
    else
        echo "No operations to undo."
    fi
    source "$SHORTCUTS_FILE"
}