# In utils/display_help.zsh
function display_help() {
    cat << EOF
Usage: shortcuts [OPTION] [ARGS...]
Manage command shortcuts with advanced features including backup, restore, grouping, profiles, and more.

Options:
  -h                Display this help message
  -a <alias> <cmd>  Add a new shortcut
  -r <alias>        Remove a shortcut
  -l                List all shortcuts
  -e <alias> <cmd>  Edit an existing shortcut
  -b                Backup current shortcuts
  -s                Restore shortcuts from the latest backup
  -g <group>        List shortcuts in a specific group
  -p <profile>      Switch to a specific profile
  -u                Undo the last operation
  -f <query>        Search for shortcuts containing <query>
  -i <file>         Import shortcuts from <file>
  -x <file>         Export shortcuts to <file>
  -c <alias>        Activate (uncomment) a shortcut
  -d <alias>        Deactivate (comment out) a shortcut

Examples:
  shortcuts -a g:ls 'ls -la'       Add a new shortcut 'ls' in group 'g'
  shortcuts -r g:ls                Remove the 'g:ls' shortcut
  shortcuts -l                     List all shortcuts
  shortcuts -e g:ls 'ls -l'        Edit the 'g:ls' shortcut to 'ls -l'
  shortcuts -b                     Backup current shortcuts
  shortcuts -s                     Restore shortcuts from the latest backup
  shortcuts -g dev                 List all 'dev' group shortcuts
  shortcuts -p work                Switch to 'work' profile shortcuts
  shortcuts -u                     Undo the last operation
  shortcuts -f "ls"                Search for shortcuts containing "ls"
  shortcuts -i my_shortcuts.zsh    Import shortcuts from 'my_shortcuts.zsh'
  shortcuts -x backup.zsh          Export shortcuts to 'backup.zsh'
  shortcuts -c g:ls                Activate the 'g:ls' shortcut
  shortcuts -d g:ls                Deactivate the 'g:ls' shortcut

Notes:
- Grouped shortcuts follow the format <group>:<name> for alias and command definition.
- Ensure the import file is in the correct format before importing.
- Activating or deactivating shortcuts does not remove them but toggles their availability.
EOF
}