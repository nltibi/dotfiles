
# Initialize zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# Load ZSH plugins using zinit
zinit wait lucid light-mode for \
  atinit"zicompinit; zicdreplay;" \
  atload"fast-theme XDG:catppuccin-mocha 2>&1 >/dev/null" \
      zdharma-continuum/fast-syntax-highlighting \
  atload"_zsh_autosuggest_start" \
      zsh-users/zsh-autosuggestions \
  blockf atpull'zinit creinstall -q .' \
      zsh-users/zsh-completions

export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval "$(starship init zsh)"

export LANG=en_US.UTF-8

# Autosuggest settings
# These need to be set after the autosuggest plugin is sourced
# so it overwrites the defaults provided by the plugin
ZSH_AUTOSUGGEST_USE_ASYNC=true
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=240'

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

# fzf -- history and fuzzy glob search
if which -p fzf >/dev/null; then
  source <(fzf --zsh)
fi

