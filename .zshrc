

source /opt/homebrew/opt/zsh-fast-syntax-highlighting/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval "$(starship init zsh)"

export LANG=en_US.UTF-8

# Autosuggest settings
# These need to be set after the autosuggest plugin is sourced
# so it overwrites the defaults provided by the plugin
ZSH_AUTOSUGGEST_USE_ASYNC=true
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=240'

# Set up syntax highlighting theme (catppuccin-mocha)
fast-theme XDG:catppuccin-mocha 2>&1 >/dev/null

# TOOL SETUP
# -------------------------------------

# zoxide
if which -p zoxide >/dev/null; then 
   eval "$(zoxide init zsh)"
fi

# NeoVim
if which -p nvim >/dev/null; then 
   # Use NeoVim instead of vim
   alias vim="nvim"
   alias v="nvim"
   export EDITOR="$(which nvim)"
fi

# eza
if which -p eza >/dev/null; then
   alias eza="eza -l --icons=auto --git"
   alias ll="eza -l --icons=auto --git"
   alias l="ll"
fi
