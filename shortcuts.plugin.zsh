# shortcuts.plugin.zsh

# Define file and directory paths
SHORTCUTS_FILE="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/shortcuts/shortcuts.zsh"
BACKUP_DIR="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/shortcuts/backups"
PROFILE_DIR="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/shortcuts/profiles"

# Ensure the necessary directories and files exist
[[ ! -f "$SHORTCUTS_FILE" ]] && touch "$SHORTCUTS_FILE"
[[ ! -d "$BACKUP_DIR" ]] && mkdir -p "$BACKUP_DIR"
[[ ! -d "$PROFILE_DIR" ]] && mkdir -p "$PROFILE_DIR"

# Function: Display help
function display_help() {
    cat << EOF
Usage: shortcuts [OPTION] [ARGS...]
Manage command shortcuts with advanced features including backup, restore, grouping, and profiles.

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

Examples:
  shortcuts -a g:ls 'ls -la'       Add a new shortcut 'ls' in group 'g'
  shortcuts -r g:ls                Remove the 'g:ls' shortcut
  shortcuts -l                     List all shortcuts
  shortcuts -e g:ls 'ls -l'        Edit the 'g:ls' shortcut to 'ls -l'
  shortcuts -b                     Backup current shortcuts
  shortcuts -s                     Restore shortcuts from the latest backup
  shortcuts -g dev                 List all 'dev' group shortcuts
  shortcuts -p work                Switch to 'work' profile shortcuts
EOF
}

# Function: Backup shortcuts
function backup_shortcuts() {
    local timestamp=$(date "+%Y%m%d%H%M%S")
    cp "$SHORTCUTS_FILE" "$BACKUP_DIR/shortcuts_$timestamp.zsh"
    echo "Backup created: shortcuts_$timestamp.zsh"
}

# Function: Restore shortcuts
function restore_shortcuts() {
    local latest_backup=$(ls -t "$BACKUP_DIR" | head -1)
    [[ -z "$latest_backup" ]] && { echo "No backup found."; return 1; }
    cp "$BACKUP_DIR/$latest_backup" "$SHORTCUTS_FILE"
    echo "Restored from backup: $latest_backup"
    source "$SHORTCUTS_FILE"
}

# Function: Add a new shortcut
function add_shortcut() {
    grep -q "^alias $1=" "$SHORTCUTS_FILE" && { echo "Shortcut '$1' already exists."; return; }
    echo "alias $1='$2'" >> "$SHORTCUTS_FILE"
    echo "Shortcut $1 added."
}

# Function: Remove an existing shortcut
function remove_shortcut() {
    grep -q "^alias $1=" "$SHORTCUTS_FILE" && {
        sed -i "" "/^alias $1=/d" "$SHORTCUTS_FILE"
        echo "Shortcut $1 removed."
        return
    }
    echo "Shortcut '$1' does not exist."
}

# Function: List all shortcuts
function list_shortcuts() {
    echo "Shortcuts available:"
    grep "^alias " "$SHORTCUTS_FILE"
}

# Function: Edit an existing shortcut
function edit_shortcut() {
    grep -q "^alias $1=" "$SHORTCUTS_FILE" && {
        sed -i "" "/^alias $1=/c\alias $1='$2'" "$SHORTCUTS_FILE"
        echo "Shortcut $1 updated."
        return
    }
    echo "Shortcut '$1' does not exist. Use -a to add it."
}

# Function: List shortcuts by group
function list_group_shortcuts() {
    echo "Shortcuts in group '$1':"
    grep "^alias $1:" "$SHORTCUTS_FILE"
}

# Function: Switch profile
function switch_profile() {
    local profile_path="$PROFILE_DIR/$1.zsh"
    [[ ! -f "$profile_path" ]] && { echo "Profile '$1' does not exist."; return; }
    cp "$profile_path" "$SHORTCUTS_FILE"
    echo "Switched to profile '$1'."
    source "$SHORTCUTS_FILE"
}

# Main function to manage shortcuts
function shortcuts() {
    case "$1" in
        -h) display_help ;;
        -a) shift; add_shortcut "$@"; source "$SHORTCUTS_FILE" ;;
        -r) shift; remove_shortcut "$@"; source "$SHORTCUTS_FILE" ;;
        -l) list_shortcuts ;;
        -e) shift; edit_shortcut "$@"; source "$SHORTCUTS_FILE" ;;
        -b) backup_shortcuts ;;
        -s) restore_shortcuts ;;
        -g) shift; list_group_shortcuts "$@" ;;
        -p) shift; switch_profile "$@" ;;
        *) echo "Invalid option. Use -h for help." ;;
    esac
}

# Autocompletion setup
function _shortcuts_autocomplete() {
    local cur=${COMP_WORDS[COMP_CWORD]}
    case "$cur" in
        -r|-e|-g)
            local aliases=$(grep "^alias " "$SHORTCUTS_FILE" | cut -d' ' -f2 | cut -d'=' -f1)
            COMPREPLY=($(compgen -W "$aliases" -- "$cur"))
            ;;
        -p)
            local profiles=$(ls "$PROFILE_DIR" | sed 's/\.zsh$//')
            COMPREPLY=($(compgen -W "$profiles" -- "$cur"))
            ;;
        *)
            COMPREPLY=($(compgen -W "-h -a -r -l -e -b -s -g -p" -- "$cur"))
            ;;
    esac
}
complete -F _shortcuts_autocomplete shortcuts

# Load existing shortcuts
source "$SHORTCUTS_FILE"