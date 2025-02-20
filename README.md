# Configuration files for various terminal utilities

This repo contains configuration files for various Unix command line tools. It is based around the wonderful `catppuccin` color scheme and includes support for various modern tools and terminal-based utilities.

## Installation

Before applying any of these config files, please make sure the following prerequisites are met:

  * you are using a modern terminal emulator that supports true (ie. 24-bit) color mode, and your terminal is configured to use any of the [Nerd Fonts](https://www.nerdfonts.com/) to display text. We recommend using [Ghostty](https://ghostty.org/) as it satisfies all of above requirements of the box. 
  * you are using `zsh` as your shell. You can use `chsh` or your OS's user account tool to change your shell. All recent macOS various use `zsh` by default.
  * the following packages are installed:
    - GNU `stow` -- for setting up symlinks to these config files.
    - `staship` -- for rendering shell prompts
    - `zsh-fast-syntax-highlighting` and `zsh-autosuggestions` -- for shell syntax highlighting and autocomplete

    On macOS, these packages can be installed directly from HomeBrew:

    ```shell
    brew install ghostty stow starship zsh-fast-syntax-highlighting zsh-autosuggestions
    ```
    On Linux, use your distribution's package manager to install these tools.

  * optionally, install the following tools:

    - [NeoVim](https://neovim.io/) -- the best text editor/IDE
    - [bat](https://github.com/sharkdp/bat) -- a replacement for the built-in `cat` shell command offering syntax highlighting and other goodies
    - [eza](https://eza.rocks/) -- a modern replacement for the built-in `ls` command
    - [zoxide](https://github.com/ajeetdsouza/zoxide) -- a smarter `cd` replacement, allowing you to quickly jump to frequently used directories
    - [lazygit](https://github.com/jesseduffield/lazygit) -- a terminal-based Git TUI
    - [yazi](https://yazi-rs.github.io/) -- a terminal-based file manager

    On macOS, these packages can be installed directly from HomeBrew:

    ```shell
    brew install neovim bat eza zoxide lazygit yazi
    ```
    On Linux, use your distribution's package manager to install these tools(your mileage might vary, some of these tools might require additional package repos to be enabled for your OS).

Once all the prerequisites are installed, clone this repo and execute `stow`:

```shell
git clone https://github.com/nltibi/dotfiles.git
cd dotfiles
stow .
```
This should symlink all config files to their proper locations. If stow throws errors, you might need to remove the existing files.
