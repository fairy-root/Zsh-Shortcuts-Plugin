![oh my zsh](https://i.imgur.com/XQruyEK.jpeg "oh my zsh")

# Shortcuts Plugin for Oh My Zsh

The Shortcuts plugin for Oh My Zsh is a powerful tool that enables you to easily manage and utilize command shortcuts directly from your terminal, enhancing productivity and streamlining your workflow.

![Termux](https://i.imgur.com/6tMn91E.jpg "Displaying help")

## Features

- **Add Shortcuts**: Quickly add new command shortcuts with ease.
- **Remove Shortcuts**: Easily remove any existing shortcuts.
- **List Shortcuts**: Conveniently view all your configured shortcuts at a glance.
- **Edit Shortcuts**: Update the command for any existing shortcut effortlessly.
- **Backup and Restore**: Securely backup your shortcuts and restore them when needed.
- **Grouping**: Organize your shortcuts into groups for better management.
- **Profiles**: Switch between different profiles to use a specific set of shortcuts tailored to your current task.
- **Undo Last Change**: Revert the most recent modification made to your shortcuts.
- **Search Shortcuts**: Find shortcuts quickly by searching for specific terms.
- **Toggle Shortcut Activation/Deactivation**: Temporarily disable or enable shortcuts without removing them.
- **Import/Export Shortcuts**: Easily move your shortcuts between different environments or backup them externally.
- **Logging**: Keep a track of all modifications made to your shortcuts for auditing or troubleshooting.
- **Enhanced Profile Management**: List all profiles, and delete specific profiles as needed.
- **Source Shortcuts File**: (the plugin sources the shortcuts automatically, this command is for sourcing it manually if the automatic sourcing fails.) Easily reload your shortcuts file to apply changes immediately.
- **Auto Completion**: Enhance command entry with suggestions by pressing **TAB**. adds a behaviour for options that require an alias or profile name as their next argument, such as -r, -e, -t for aliases, and -p, -dp for profiles. For these cases, it dynamically suggests the available aliases or profiles based on the contents of the SHORTCUTS_FILE and the profiles in the $PROFILE_DIR.

## Prerequisites

Before you can install the Shortcuts plugin, you must have Oh My Zsh installed on your system. Oh My Zsh is an open-source, community-driven framework for managing your Zsh configuration, offering thousands of helpful functions, helpers, plugins, themes, and more.

For installation instructions, please visit the Oh My Zsh GitHub repository:

[Oh My Zsh GitHub](https://github.com/ohmyzsh/ohmyzsh)

## Installation

1. **Clone the Repository**: Clone this repository into the Oh My Zsh custom plugins directory:

    ```zsh
    git clone https://github.com/fairy-root/Zsh-Shortcuts-Plugin ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/shortcuts
    ```

2. **Activate the Plugin**: Add `shortcuts` to the list of plugins in your `.zshrc` file:

    ```zsh
    nano ~/.zshrc
    ```

    ```zsh
    plugins=(... shortcuts)
    ```

3. **Apply the Changes**: Source your `.zshrc` file or restart your terminal session:

    ```zsh
    source ~/.zshrc
    ```

## Usage

To utilize the full range of functionalities offered by the Shortcuts plugin, refer to the following commands:

- **Add a Shortcut**: `shortcuts -a <alias> <command>`
- **Remove a Shortcut**: `shortcuts -r <alias>`
- **List Shortcuts**: `shortcuts -l`
- **Edit a Shortcut**: `shortcuts -e <alias> <new command>`
- **Backup Shortcuts**: `shortcuts -b`
- **Restore Shortcuts**: `shortcuts -s`
- **List Group Shortcuts**: `shortcuts -g <group>`
- **Switch Profile**: `shortcuts -p <profile>`
- **Undo Last Change**: `shortcuts -u`
- **Search for Shortcuts**: `shortcuts -f <search>`
- **Toggle Shortcut Activation/Deactivation**: `shortcuts -t <alias>`
- **Import Shortcuts**: `shortcuts -i <file>`
- **Export Shortcuts**: `shortcuts -x <file>`
- **List Profiles**: `shortcuts -lp`
- **Delete Profile**: `shortcuts -dp <profile>`
- **Source the Shortcuts File**: `shortcuts -source`

For detailed usage and more options, run `shortcuts -h`.

## Donation

Your support is appreciated:

- USDt (TRC20): `TGCVbSSJbwL5nyXqMuKY839LJ5q5ygn2uS`
- BTC: `13GS1ixn2uQAmFQkte6qA5p1MQtMXre6MT`
- ETH (ERC20): `0xdbc7a7dafbb333773a5866ccf7a74da15ee654cc`
- LTC: `Ldb6SDxUMEdYQQfRhSA3zi4dCUtfUdsPou`

---

![oh my zsh](https://i.imgur.com/XQruyEK.jpeg "oh my zsh")

## Contributing

Your contributions are always welcome! Feel free to open an issue or submit a pull request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
