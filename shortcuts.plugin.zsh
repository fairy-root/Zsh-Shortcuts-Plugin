# shortcuts.plugin.zsh

# Define file and directory paths
SHORTCUTS_FILE="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/shortcuts/shortcuts.zsh"
BACKUP_DIR="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/shortcuts/backups"
PROFILE_DIR="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/shortcuts/profiles"
LOG_FILE="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/shortcuts/log.txt"
LAST_ACTION_FILE="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/shortcuts/last_action.zsh"

# Ensure the necessary directories and files exist
[[ ! -f "$SHORTCUTS_FILE" ]] && touch "$SHORTCUTS_FILE"
[[ ! -d "$BACKUP_DIR" ]] && mkdir -p "$BACKUP_DIR"
[[ ! -d "$PROFILE_DIR" ]] && mkdir -p "$PROFILE_DIR"
[[ ! -f "$LOG_FILE" ]] && touch "$LOG_FILE"
[[ ! -f "$LAST_ACTION_FILE" ]] && touch "$LAST_ACTION_FILE"

# Function to log actions
log_action() {
    echo "$(date "+%Y-%m-%d %H:%M:%S") - $1" >> "$LOG_FILE"
}

# Function to source the shortcuts file
function source_shortcuts_file() {
    source "$SHORTCUTS_FILE"
    echo "Shortcuts reloaded successfully."
}

# Function: Display help
function display_help() {
    cat << EOF
Usage: shortcuts [OPTION] [ARGS...]
Manage command shortcuts with features including backup, restore, grouping, profiles, undo, search, toggle, import/export, and logging.

Options:
  -h                Display help
  -a <alias> <cmd>  Add a new shortcut
  -r <alias>        Remove a shortcut
  -l                List all shortcuts
  -e <alias> <cmd>  Edit an existing shortcut
  -b                Backup current shortcuts
  -s                Restore shortcuts from the latest backup
  -g <group>        List shortcuts in a specific group
  -p <profile>      Switch to a specific profile
  -u                Undo last action
  -f <search>       Search shortcuts
  -t <alias>        Toggle shortcut activation/deactivation
  -i <file>         Import shortcuts from a file
  -x <file>         Export shortcuts to a file
  -lp               List all profiles
  -dp <profile>     Delete a specific profile

Examples:
  shortcuts -a g:ls 'ls -la'       Add a new shortcut 'ls' in group 'g'
  shortcuts -r g:ls                Remove the 'g:ls' shortcut
  shortcuts -l                     List all shortcuts
  shortcuts -e g:ls 'ls -l'        Edit the 'g:ls' shortcut to 'ls -l'
  shortcuts -b                     Backup current shortcuts
  shortcuts -s                     Restore shortcuts from the latest backup
  shortcuts -g dev                 List all 'dev' group shortcuts
  shortcuts -p work                Switch to 'work' profile shortcuts
  shortcuts -u                     Undo last change
  shortcuts -f "pattern"           Search shortcuts with "pattern"
  shortcuts -t alias               Toggle shortcut activation/deactivation
  shortcuts -i /path/to/file       Import shortcuts from a file
  shortcuts -x /path/to/file       Export shortcuts to a file
  shortcuts -lp                    List all profiles
  shortcuts -dp work               Delete 'work' profile
EOF
}

# Backup functions
function backup_shortcuts() {
    local timestamp=$(date "+%Y%m%d%H%M%S")
    cp "$SHORTCUTS_FILE" "$BACKUP_DIR/shortcuts_$timestamp.zsh"
    echo "Backup created: shortcuts_$timestamp.zsh"
    log_action "Backup created: shortcuts_$timestamp.zsh"
}

function restore_shortcuts() {
    local latest_backup=$(ls -t "$BACKUP_DIR" | head -1)
    if [[ -z "$latest_backup" ]]; then
        echo "No backup found."
        return 1
    fi
    cp "$BACKUP_DIR/$latest_backup" "$SHORTCUTS_FILE"
    echo "Restored from backup: $latest_backup"
    source_shortcuts_file
    log_action "Restored from backup: $latest_backup"
}

# Undo functionality
function undo_last_change() {
    local last_backup=$(cat "$LAST_ACTION_FILE")
    if [[ -z "$last_backup" ]]; then
        echo "No last action to undo."
        return 1
    fi
    if [[ -f "$BACKUP_DIR/$last_backup.zsh" ]]; then
        cp "$BACKUP_DIR/$last_backup.zsh" "$SHORTCUTS_FILE"
        echo "Undo successful: restored $last_backup"
        source_shortcuts_file
        log_action "Undo successful: restored $last_backup"
    else
        echo "Undo failed: backup not found."
    fi
}

# Add a new shortcut
function add_shortcut() {
    pre_change_backup
    if grep -q "^alias $1=" "$SHORTCUTS_FILE"; then
        echo "Shortcut '$1' already exists."
        return 1
    fi
    echo "alias $1='$2'" >> "$SHORTCUTS_FILE"
    echo "Shortcut $1 added."
    log_action "Shortcut $1 added."
    source_shortcuts_file
}

# Remove an existing shortcut
function remove_shortcut() {
    pre_change_backup
    if grep -q "^alias $1=" "$SHORTCUTS_FILE"; then
        if [[ "$OSTYPE" == "darwin"* ]]; then
            sed -i "" "/^alias $1=/d" "$SHORTCUTS_FILE"
        else
            sed -i "/^alias $1=/d" "$SHORTCUTS_FILE"
        fi
        echo "Shortcut $1 removed."
        log_action "Shortcut $1 removed."
        source_shortcuts_file
    else
        echo "Shortcut '$1' does not exist."
    fi
}

# Edit an existing shortcut
function edit_shortcut() {
    pre_change_backup
    if grep -q "^alias $1=" "$SHORTCUTS_FILE"; then
        if [[ "$OSTYPE" == "darwin"* ]]; then
            sed -i "" "/^alias $1=/c\alias $1='$2'" "$SHORTCUTS_FILE"
        else
            sed -i "/^alias $1=/c\alias $1='$2'" "$SHORTCUTS_FILE"
        fi
        echo "Shortcut $1 updated."
        log_action "Shortcut $1 updated."
        source_shortcuts_file
    else
        echo "Shortcut '$1' does not exist. Use -a to add it."
    fi
}

# List all shortcuts
function list_shortcuts() {
    echo "Shortcuts available:"
    grep "^alias " "$SHORTCUTS_FILE"
}

# Search for shortcuts
function search_shortcuts() {
    local pattern=$1
    echo "Searching for shortcuts containing '$pattern':"
    grep -E "alias .*${pattern}.*=" "$SHORTCUTS_FILE" | less
}

# Toggle shortcut activation/deactivation
function toggle_shortcut() {
    pre_change_backup
    local alias_name=$1
    if grep -q "^alias $alias_name=" "$SHORTCUTS_FILE"; then
        if [[ "$OSTYPE" == "darwin"* ]]; then
            sed -i "" "s/^alias $alias_name=/#&/" "$SHORTCUTS_FILE"
        else
            sed -i "s/^alias $alias_name=/#&/" "$SHORTCUTS_FILE"
        fi
        echo "Shortcut $alias_name deactivated."
        log_action "Shortcut $alias_name deactivated."
        source_shortcuts_file
    elif grep -q "^#alias $alias_name=" "$SHORTCUTS_FILE"; then
        if [[ "$OSTYPE" == "darwin"* ]]; then
            sed -i "" "s/^#alias $alias_name=/alias $alias_name=/" "$SHORTCUTS_FILE"
        else
            sed -i "s/^#alias $alias_name=/alias $alias_name=/" "$SHORTCUTS_FILE"
        fi
        echo "Shortcut $alias_name activated."
        log_action "Shortcut $alias_name activated."
        source_shortcuts_file
    else
        echo "Shortcut '$alias_name' does not exist."
    fi
}

# Import and Export shortcuts
function import_shortcuts() {
    pre_change_backup
    local import_file=$1
    if [[ -f "$import_file" ]]; then
        cp "$import_file" "$SHORTCUTS_FILE"
        echo "Imported shortcuts from $import_file."
        log_action "Imported shortcuts from $import_file."
        source_shortcuts_file
    else
        echo "Import file does not exist."
    fi
}

function export_shortcuts() {
    local export_file=$1
    cp "$SHORTCUTS_FILE" "$export_file"
    echo "Exported shortcuts to $export_file."
    log_action "Exported shortcuts to $export_file."
}

# Switch profile
function switch_profile() {
    pre_change_backup
    local profile_path="$PROFILE_DIR/$1.zsh"
    if [[ ! -f "$profile_path" ]]; then
        echo "Profile '$1' does not exist."
        return 1
    fi
    cp "$profile_path" "$SHORTCUTS_FILE"
    echo "Switched to profile '$1'."
    source_shortcuts_file
    log_action "Switched to profile '$1'."
}

# Pre-change backup
function pre_change_backup() {
    local timestamp=$(date "+%Y%m%d%H%M%S")
    cp "$SHORTCUTS_FILE" "$BACKUP_DIR/pre_change_$timestamp.zsh"
    echo "pre_change_$timestamp" > "$LAST_ACTION_FILE"
}

# Autocompletion setup
function _shortcuts_autocomplete() {
    local cur=${COMP_WORDS[COMP_CWORD]}
    local actions="-h -a -r -l -e -b -s -g -p -u -f -t -i -x -lp -dp"
    case "$cur" in
        -r|-e|-t)
            local aliases=$(grep "^alias " "$SHORTCUTS_FILE" | cut -d' ' -f2 | cut -d'=' -f1)
            COMPREPLY=($(compgen -W "$aliases" -- "$cur"))
            ;;
        -p|-dp)
            local profiles=$(ls "$PROFILE_DIR" | sed 's/\.zsh$//')
            COMPREPLY=($(compgen -W "$profiles" -- "$cur"))
            ;;
        *)
            COMPREPLY=($(compgen -W "$actions" -- "$cur"))
            ;;
    esac
}
complete -F _shortcuts_autocomplete shortcuts

# List all profiles
function list_profiles() {
    echo "Available profiles:"
    local profiles=$(ls "$PROFILE_DIR" | sed 's/\.zsh$//')
    echo "$profiles"
}

# Delete a specific profile
function delete_profile() {
    local profile=$1
    local profile_path="$PROFILE_DIR/${profile}.zsh"
    if [[ -f "$profile_path" ]]; then
        rm -f "$profile_path"
        echo "Profile '$profile' deleted."
        log_action "Profile '$profile' deleted."
    else
        echo "Profile '$profile' does not exist."
    fi
}

# Main function to manage shortcuts
function shortcuts() {
    case "$1" in
        -h) display_help ;;
        -a) shift; add_shortcut "$@" ;;
        -r) shift; remove_shortcut "$@" ;;
        -l) list_shortcuts ;;
        -e) shift; edit_shortcut "$@" ;;
        -b) backup_shortcuts ;;
        -s) restore_shortcuts ;;
        -g) shift; list_group_shortcuts "$@" ;;
        -p) shift; switch_profile "$@" ;;
        -u) undo_last_change ;;
        -f) shift; search_shortcuts "$@" ;;
        -t) shift; toggle_shortcut "$@" ;;
        -i) shift; import_shortcuts "$@" ;;
        -x) shift; export_shortcuts "$@" ;;
        -lp) list_profiles ;;
        -dp) shift; delete_profile "$@" ;;
        *) echo "Invalid option. Use -h for help." ;;
    esac
}

# Load existing shortcuts
source "$SHORTCUTS_FILE"