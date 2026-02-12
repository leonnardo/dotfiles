# =============================================================================
# KEYBINDINGS
# =============================================================================
# Native zsh vi-mode is enabled in zshrc. This file defines additional bindings.

# -----------------------------------------------------------------------------
# Vi-mode configuration
# -----------------------------------------------------------------------------
# Use jk to exit insert mode (like ZVM_VI_INSERT_ESCAPE_BINDKEY=jk)
bindkey -M viins 'jk' vi-cmd-mode

# -----------------------------------------------------------------------------
# fzf keybindings (set after fzf loads in turbo mode)
# -----------------------------------------------------------------------------
# Note: fzf bindings are set up in the turbo-loaded fzf section of zshrc
# via `source <(fzf --zsh)`. The following ensures they work in vi-mode.

# These will be available after fzf-tab loads (wait"0b"):
# Ctrl+R: fzf-history-widget (history search)
# Ctrl+T: fzf-file-widget (file search)  
# Alt+C:  fzf-cd-widget (cd to directory)
# Ctrl+O: zoxide interactive (bound in zoxide's atload)
