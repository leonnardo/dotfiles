# vim mode
bindkey -v

# Define key names and their corresponding key sequences
declare -A keys=(
    [key_up]="^[[A"   # Up key
    [key_down]="^[[B" # Down key
)

# Bind keys for history search
if [[ -n "${keys[key_up]}" && -n "${keys[key_down]}" ]]; then
    bindkey "${keys[key_up]}" history-incremental-search-backward  # Search history with Up key
    bindkey "${keys[key_down]}" history-incremental-search-forward  # Search history with Down key
    bindkey -M vicmd "${keys[key_up]}" history-incremental-search-backward  # Search history with Up key
    bindkey -M vicmd "${keys[key_down]}" history-incremental-search-forward  # Search history with Down key
else
    echo "Error: Key sequences for Up/Down are not defined."
fi

# Other keybindings
bindkey '^o' cdi
