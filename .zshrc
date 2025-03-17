
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

#
# ZSH OPTIONS
# ---------------------------------
setopt autocd              # automatically cd into a directory if only dir name given
setopt interactivecomments # allow comments in interactive mode
setopt magicequalsubst     # allow filename completion in arguemnt of the form `argname=file`
setopt notify              # automatically report background job status
setopt numericglobsort     # sort expanded file names numerically
setopt nobeep              # do not beep on errors

#
# HISTORY OPTIONS
# ---------------------------------
HISTSIZE=20000
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
