# =============================================================================
# KEYBINDINGS
# =============================================================================
# zsh-vi-mode handles vim mode setup. This file defines the callback
# to restore fzf keybindings after vi-mode initializes.

# -----------------------------------------------------------------------------
# zsh-vi-mode callback - restores fzf bindings after vi-mode init
# -----------------------------------------------------------------------------
function zvm_after_init() {
    # Restore fzf keybindings (fzf --zsh sets these, but vi-mode overrides them)
    if (( $+commands[fzf] )); then
        # These bindings match fzf's default zsh integration
        bindkey '^R' fzf-history-widget      # Ctrl+R: history search
        bindkey '^T' fzf-file-widget         # Ctrl+T: file search
        bindkey '\ec' fzf-cd-widget          # Alt+C: cd to directory
    fi
    # Note: Ctrl+O (cdi) is bound in zoxide's atload, after zoxide initializes
}

# -----------------------------------------------------------------------------
# zsh-vi-mode configuration
# -----------------------------------------------------------------------------
# Reduce escape key delay for faster mode switching
ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
ZVM_KEYTIMEOUT=0.1
