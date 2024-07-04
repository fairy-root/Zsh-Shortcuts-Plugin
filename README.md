# Shortcuts Plugin for Zsh / Oh My Zsh

**Enhance your terminal productivity with the Shortcuts plugin for Oh My Zsh. Easily manage command shortcuts with robust features.**

![Termux](https://i.imgur.com/I2wjmj5.jpeg "Displaying help")

## Features

- **Add, Remove, Edit Shortcuts**
- **Backup and Restore Shortcuts**
- **Grouping and Profiles Management**
- **Undo Last Change**
- **Search and Toggle Shortcuts**
- **Import/Export Shortcuts**
- **Logging Actions**
- **Auto Completion**
- **Link Management**: Add/remove links to import shortcuts
- **Remove All Shortcuts**
- **Default Profile**: Automatically created for new users
- **Update Shortcuts from Links**
- **Add New Profiles**

## Installation

### Oh My Zsh

1. Clone the repository:
    ```sh
    git clone https://github.com/fairy-root/Zsh-Shortcuts-Plugin ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/shortcuts
    ```

2. Activate the plugin:
    ```sh
    nano ~/.zshrc
    plugins=(... shortcuts)
    source ~/.zshrc
    ```

### Zsh (without Oh My Zsh)

1. Clone the repository:
    ```sh
    git clone https://github.com/fairy-root/Zsh-Shortcuts-Plugin ~/zsh-custom-plugins/shortcuts
    ```

2. Source the plugin in your `.zshrc`:
    ```sh
    echo "source ~/zsh-custom-plugins/shortcuts/shortcuts.plugin.zsh" >> ~/.zshrc
    source ~/.zshrc
    ```

## Usage

- **Add**: `shortcuts -a <alias> <command>`
- **Remove**: `shortcuts -r <alias>`
- **List**: `shortcuts -l`
- **Edit**: `shortcuts -e <alias> <new command>`
- **Backup**: `shortcuts -b`
- **Restore**: `shortcuts -s`
- **Group List**: `shortcuts -g <group>`
- **Switch Profile**: `shortcuts -p <profile>`
- **Add New Profile**: `shortcuts -ap <profile>`
- **Undo**: `shortcuts -u`
- **Search**: `shortcuts -f <pattern>`
- **Toggle**: `shortcuts -t <alias>`
- **Import**: `shortcuts -i <file>`
- **Export**: `shortcuts -x <file>`
- **List Profiles**: `shortcuts -lp`
- **Delete Profile**: `shortcuts -dp <profile>`
- **Source File**: `shortcuts -source`
- **Add Link**: `shortcuts -la <link>`
- **Remove Link**: `shortcuts -rl <link>`
- **Remove All**: `shortcuts -ra`
- **Update Shortcuts from Links**: `shortcuts -up`

For detailed options, run `shortcuts -h`.

## Compatibility

- **Termux (Android)**
  - Install Zsh and Git:
    ```sh
    pkg install zsh git
    ```

- **Linux/Ubuntu**
  - Install Zsh and Git:
    ```sh
    sudo apt-get install zsh git
    ```

- **macOS**
  - Install Zsh and Git using Homebrew if necessary:
    ```sh
    brew install zsh git
    ```

- **Windows (WSL)**
  - Enable WSL and install a Linux distribution, then follow Linux/Ubuntu steps.

## Contributing

Contributions are welcome! Open an issue or submit a pull request.

## License

This project is licensed under the MIT License.

---

![oh my zsh](https://i.imgur.com/XQruyEK.jpeg "oh my zsh")

## Donation

Support this project:

- USDt (TRC20): `TGCVbSSJbwL5nyXqMuKY839LJ5q5ygn2uS`
- BTC: `13GS1ixn2uQAmFQkte6qA5p1MQtMXre6MT`
- ETH (ERC20): `0xdbc7a7dafbb333773a5866ccf7a74da15ee654cc`
- LTC: `Ldb6SDxUMEdYQQfRhSA3zi4dCUtfUdsPou`