# In utils/import_export.zsh
function export_shortcuts() {
    local export_file="${BACKUP_DIR}/exported_shortcuts_$(date "+%Y%m%d%H%M%S").zsh"
    cp "$SHORTCUTS_FILE" "$export_file"
    echo "Shortcuts exported to $export_file"
}

function import_shortcuts() {
    local import_file="$1"
    if [[ -f "$import_file" ]]; then
        cp "$import_file" "$SHORTCUTS_FILE"
        echo "Shortcuts imported from $import_file"
        source "$SHORTCUTS_FILE"
    else
        echo "Import file does not exist."
    fi
}