# In utils/logging_reporting.zsh
function log_operation() {
    local operation="$1"
    echo "$(date "+%Y%m%d%H%M%S") - $operation" >> "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/shortcuts/operations.log"
}