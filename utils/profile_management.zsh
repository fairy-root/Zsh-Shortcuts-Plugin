# In utils/profile_management.zsh

function switch_profile() {
    local profile_path="$PROFILE_DIR/$1.zsh"
    if [[ ! -f "$profile_path" ]]; then 
        echo "Profile '$1' does not exist."
        return 1
    fi
    cp "$profile_path" "$SHORTCUTS_FILE"
    echo "Switched to profile '$1'."
    source "$SHORTCUTS_FILE"
}