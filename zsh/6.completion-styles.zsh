# =============================================================================
# COMPLETION STYLING & BEHAVIOR (zstyle configuration)
# =============================================================================

# -----------------------------------------------------------------------------
# Basic completion behavior
# -----------------------------------------------------------------------------

# Case-insensitive completion with advanced matching
# Supports: case conversion, partial matching on word boundaries
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=** r:|=**' 'l:|=* r:|=*'

# Use LS_COLORS for completion menu colors
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Disable traditional zsh menu (fzf-tab will handle this)
zstyle ':completion:*' menu no

# Group completion results and show group descriptions
zstyle ':completion:*:descriptions' format '[%d]'

# -----------------------------------------------------------------------------
# fzf-tab specific configuration
# -----------------------------------------------------------------------------

# Use eza for directory previews (cd command)
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'

# Use eza for zoxide completion previews
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza -1 --color=always $realpath'

# Show process info when completing kill/ps commands
zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-preview 'ps --pid=$word -o pid,ppid,user,command'

# Preview environment variables
zstyle ':fzf-tab:complete:(-command-|-parameter-|-brace-parameter-|export|unset|expand):*' fzf-preview 'echo ${(P)word}'

# Use < and > to switch between completion groups
zstyle ':fzf-tab:*' switch-group '<' '>'

# Honor FZF_DEFAULT_OPTS settings
zstyle ':fzf-tab:*' use-fzf-default-opts yes

# -----------------------------------------------------------------------------
# Command-specific completion behavior
# -----------------------------------------------------------------------------

# Don't sort git branches (shows recent ones first)
zstyle ':completion:*:git-checkout:*' sort false

# Group git commands by category
zstyle ':completion:*:*:git:*' group-order 'main commands' 'alias commands' 'external commands'