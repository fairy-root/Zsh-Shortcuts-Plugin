# Shortcuts Plugin for Oh My Zsh

The Shortcuts plugin for Oh My Zsh allows you to easily manage and use command shortcuts directly from your terminal.

## Features

- **Add Shortcuts**: Quickly add new command shortcuts.
- **Remove Shortcuts**: Easily remove existing shortcuts.
- **List Shortcuts**: View all configured shortcuts at a glance.
- **Edit Shortcuts**: Update the command for any existing shortcut.

## Prerequisites

Before installing the Shortcuts plugin, you must have Oh My Zsh installed on your system. Oh My Zsh is an open-source, community-driven framework for managing your Zsh configuration. It comes bundled with thousands of helpful functions, helpers, plugins, themes, and a few things that make you shout...

"Oh My ZSH!"

For installation instructions, visit the Oh My Zsh GitHub repository:

[Oh My Zsh GitHub](https://github.com/ohmyzsh/ohmyzsh)

## Installation

1. **Clone the Repository**: Clone this repository into the Oh My Zsh custom plugins directory:

    ```zsh
    git clone https://github.com/fairysubsteam/Zsh-Shortcuts-Plugin ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/shortcuts
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

The plugin supports **auto sourcing** for the shortcuts added, removed, or edited in the active session. To apply sourcing for other active sessions, you'll need to source your `.zshrc` or restart the session/terminal window.

For detailed usage and options, run `shortcuts -h`.

## Contributing

Contributions are welcome! Feel free to open an issue or submit a pull request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
