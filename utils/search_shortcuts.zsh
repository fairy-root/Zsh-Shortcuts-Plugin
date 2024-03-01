# In utils/search_shortcuts.zsh
function search_shortcuts() {
    local query="$1"
    echo "Searching for shortcuts containing '$query':"
    grep -i "$query" "$SHORTCUTS_FILE" | cut -d' ' -f2-
}