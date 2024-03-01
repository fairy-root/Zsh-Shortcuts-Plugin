# In utils/backup_restore.zsh

function backup_shortcuts() {
    local timestamp=$(date "+%Y%m%d%H%M%S")
    cp "$SHORTCUTS_FILE" "$BACKUP_DIR/shortcuts_$timestamp.zsh"
    echo "Backup created: shortcuts_$timestamp.zsh"
}

function restore_shortcuts() {
    local latest_backup=$(ls -t "$BACKUP_DIR" | head -1)
    if [[ -z "$latest_backup" ]]; then 
        echo "No backup found."
        return 1
    fi
    cp "$BACKUP_DIR/$latest_backup" "$SHORTCUTS_FILE"
    echo "Restored from backup: $latest_backup"
    source "$SHORTCUTS_FILE"
}