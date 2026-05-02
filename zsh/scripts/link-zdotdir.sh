#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ZSH_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
TARGET_ZDOTDIR="${ZDOTDIR:-${XDG_CONFIG_HOME:-$HOME/.config}/zsh}"

conflicts=0

link_item() {
    local source_path="$1"
    local target_path="$2"

    if [[ -L "$target_path" ]]; then
        local current_target
        current_target="$(readlink "$target_path")"

        if [[ "$current_target" == "$source_path" ]]; then
            echo "ok      $target_path"
            return
        fi

        rm "$target_path"
        ln -s "$source_path" "$target_path"
        echo "update  $target_path -> $source_path"
        return
    fi

    if [[ -e "$target_path" ]]; then
        echo "skip    $target_path (existing non-symlink file)"
        conflicts=1
        return
    fi

    ln -s "$source_path" "$target_path"
    echo "link    $target_path -> $source_path"
}

mkdir -p "$TARGET_ZDOTDIR"

link_item "$REPO_ZSH_DIR/zshrc" "$TARGET_ZDOTDIR/.zshrc"
link_item "$REPO_ZSH_DIR/zprofile" "$TARGET_ZDOTDIR/.zprofile"
link_item "$REPO_ZSH_DIR/.zsh_plugins.txt" "$TARGET_ZDOTDIR/.zsh_plugins.txt"
link_item "$REPO_ZSH_DIR/rc.d" "$TARGET_ZDOTDIR/rc.d"

if [[ -d "$REPO_ZSH_DIR/func" ]]; then
    link_item "$REPO_ZSH_DIR/func" "$TARGET_ZDOTDIR/func"
fi

if (( conflicts )); then
    echo
    echo "Some files were not linked because they already exist as regular files."
    echo "Move them aside or remove them, then rerun this script."
    exit 1
fi

echo
echo "ZDOTDIR links are ready in $TARGET_ZDOTDIR"
