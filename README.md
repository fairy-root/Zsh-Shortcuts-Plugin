# Shortcuts Plugin for Oh My Zsh

The Shortcuts plugin for Oh My Zsh is a powerful tool that enables you to easily manage and utilize command shortcuts directly from your terminal, enhancing productivity and streamlining your workflow.

## Features

- **Add Shortcuts**: Quickly add new command shortcuts with ease.
- **Remove Shortcuts**: Easily remove any existing shortcuts.
- **List Shortcuts**: Conveniently view all your configured shortcuts at a glance.
- **Edit Shortcuts**: Update the command for any existing shortcut effortlessly.
- **Backup and Restore**: Securely backup your shortcuts and restore them when needed.
- **Grouping**: Organize your shortcuts into groups for better management.
- **Profiles**: Switch between different profiles to use a specific set of shortcuts tailored to your current task.

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

- **Add a Shortcut**: `shortcuts -a <alias> <command>`
- **Remove a Shortcut**: `shortcuts -r <alias>`
- **List Shortcuts**: `shortcuts -l`
- **Edit a Shortcut**: `shortcuts -e <alias> <new command>`
- **Backup Shortcuts**: `shortcuts -b`
- **Restore Shortcuts**: `shortcuts -s`
- **List Group Shortcuts**: `shortcuts -g <group>`
- **Switch Profile**: `shortcuts -p <profile>`

Auto sourcing is supported for shortcuts added, removed, or edited within the active session. To apply changes to other active sessions, source your `.zshrc` or restart the terminal.

For detailed usage and more options, run `shortcuts -h`.

## Donation
- USDt (TRC20): `TGCVbSSJbwL5nyXqMuKY839LJ5q5ygn2uS`
- BTC: `13GS1ixn2uQAmFQkte6qA5p1MQtMXre6MT`
- ETH (ERC20): `0xdbc7a7dafbb333773a5866ccf7a74da15ee654cc`
- LTC: `Ldb6SDxUMEdYQQfRhSA3zi4dCUtfUdsPou`

## Contributing

Your contributions are always welcome! Feel free to open an issue or submit a pull request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.