# Shortcuts Plugin for Oh My Zsh

The Shortcuts plugin for Oh My Zsh allows you to easily manage and use command shortcuts directly from your terminal.

## Features

- **Add Shortcuts**: Quickly add new command shortcuts.
- **Remove Shortcuts**: Easily remove existing shortcuts.
- **List Shortcuts**: View all configured shortcuts at a glance.
- **Edit Shortcuts**: Update the command for any existing shortcut.

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

- **Add a Shortcut**: `shortcut -a <alias> <command>`
- **Remove a Shortcut**: `shortcut -r <alias>`
- **List Shortcuts**: `shortcut -l`
- **Edit a Shortcut**: `shortcut -e <alias> <new command>`

For detailed usage and options, run `shortcut -h`.

## Contributing

Contributions are welcome! Feel free to open an issue or submit a pull request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.