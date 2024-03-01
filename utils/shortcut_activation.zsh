# In utils/shortcut_activation.zsh
function activate_shortcut() {
    local shortcut="$1"
    sed -i "" "/^#alias $shortcut=/s/^#//" "$SHORTCUTS_FILE"
    echo "Shortcut $shortcut activated."
}

function deactivate_shortcut() {
    local shortcut="$1"
    sed -i "" "/^alias $shortcut=/s/^/#/" "$SHORTCUTS_FILE"
    echo "Shortcut $shortcut deactivated."
}