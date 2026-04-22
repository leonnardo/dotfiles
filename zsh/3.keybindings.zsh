# =============================================================================
# KEYBINDINGS
# =============================================================================
# `bindkey -v` and KEYTIMEOUT are set in zshrc (must run before this file is
# sourced so viins/vicmd keymaps exist).

# -----------------------------------------------------------------------------
# Vi-mode: cursor shape per keymap
# -----------------------------------------------------------------------------
function zle-keymap-select {
    case $KEYMAP in
        vicmd) echo -ne '\e[2 q';;      # block cursor for normal mode
        viins|main) echo -ne '\e[6 q';; # beam cursor for insert mode
    esac
}
zle -N zle-keymap-select

function zle-line-init {
    echo -ne '\e[6 q'
}
zle -N zle-line-init

# -----------------------------------------------------------------------------
# Edit current command line in $EDITOR (neovim)
# -----------------------------------------------------------------------------
# - `v` in normal mode (vi-like: same as bash vi-mode)
# - `Ctrl-X Ctrl-E` in insert mode (bash-compatible)
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd 'v' edit-command-line
bindkey -M viins '^X^E' edit-command-line

# -----------------------------------------------------------------------------
# fzf: up-arrow opens history search
# -----------------------------------------------------------------------------
# fzf-history-widget is defined later by `eval "$(fzf --zsh)"` in zshrc.
# bindkey resolves the widget name at invocation time, so binding early is fine.
bindkey -M viins "^[[A" fzf-history-widget
bindkey -M vicmd "^[[A" fzf-history-widget

# -----------------------------------------------------------------------------
# zoxide: Ctrl-O opens interactive directory jump
# -----------------------------------------------------------------------------
# __zoxide_zi is defined later by `eval "$(zoxide init ...)"` in zshrc.
function _zoxide_cdi_widget() { __zoxide_zi; zle reset-prompt }
zle -N _zoxide_cdi_widget
bindkey -M viins '^o' _zoxide_cdi_widget
bindkey -M vicmd '^o' _zoxide_cdi_widget
