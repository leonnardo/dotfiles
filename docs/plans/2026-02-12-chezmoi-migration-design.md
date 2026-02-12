# Chezmoi Migration Design

## Overview

Migrate dotfiles from the current symlink-based setup (`~/Projects/dotfiles/` with manual symlinks into `~/.config/`) to a chezmoi-managed setup. Fresh repo at `~/.local/share/chezmoi/`.

**Machines:** macOS (personal), Linux (work), Windows (rare)
**Secrets:** 1Password integration (`onepasswordRead`)
**OS handling:** `.chezmoiignore` with OS conditionals

## Configs to Migrate (22)

### Cross-platform (all OS)

| Source dir | Chezmoi target | Notes |
|---|---|---|
| bat | `~/.config/bat/` | |
| btop | `~/.config/btop/` | private_ prefix (restricted perms) |
| direnv | `~/.config/direnv/` | |
| k9s | `~/.config/k9s/` | private_ prefix |
| lazygit | `~/.config/lazygit/` | |
| lazyvim | `~/.config/nvim/` | Source dir is "lazyvim", target is "nvim" |
| oh-my-posh | `~/.config/oh-my-posh/` | |
| opencode | `~/.config/opencode/` | |
| tmux | `~/.config/tmux/` | Includes plugins/ subdir |
| wezterm | `~/.config/wezterm/` | |
| yamllint | `~/.config/yamllint/` | |
| zsh | `~/.config/zsh/` | ZDOTDIR set in /etc/zshenv |

### macOS only

| Source dir | Chezmoi target |
|---|---|
| aerospace | `~/.config/aerospace/` |
| ghostty | `~/.config/ghostty/` |
| kanata | `~/.config/kanata/` |
| karabiner | `~/.config/karabiner/` |
| sketchybar | `~/.config/sketchybar/` |
| skhd | `~/.config/skhd/` |
| spacebar | `~/.config/spacebar/` |
| yabai | `~/.config/yabai/` |

### Linux only

| Source dir | Chezmoi target |
|---|---|
| hyprland | `~/.config/hyprland/` |
| waybar | `~/.config/waybar/` |

### Skipped (legacy/unused)

nvim (old config), fzf (handled in zshrc), copilot-cli, neofetch, alacritty, htop, kitty, yazi

## Chezmoi Source Structure

```
~/.local/share/chezmoi/
├── .chezmoi.yaml.tmpl              # init config (email, machineType)
├── .chezmoiignore                  # OS-conditional ignores
├── dot_config/
│   ├── aerospace/
│   │   └── aerospace.toml
│   ├── bat/
│   │   └── config
│   ├── private_btop/
│   │   └── btop.conf
│   ├── direnv/
│   │   └── direnvrc
│   ├── ghostty/
│   │   └── config
│   ├── hyprland/
│   │   └── hyprland.conf
│   ├── private_k9s/
│   │   ├── private_aliases.yaml
│   │   └── private_config.yaml
│   ├── kanata/
│   │   └── ...
│   ├── karabiner/
│   │   ├── assets/
│   │   └── karabiner.json
│   ├── lazygit/
│   │   └── config.yml
│   ├── nvim/                       # from lazyvim/ source
│   │   ├── init.lua
│   │   ├── lua/
│   │   └── ...
│   ├── oh-my-posh/
│   │   └── theme.toml
│   ├── opencode/
│   │   └── ...
│   ├── sketchybar/
│   │   └── ...
│   ├── skhd/
│   │   └── ...
│   ├── spacebar/
│   │   └── ...
│   ├── tmux/
│   │   ├── tmux.conf
│   │   └── plugins/
│   ├── waybar/
│   │   └── ...
│   ├── wezterm/
│   │   └── ...
│   ├── yabai/
│   │   └── ...
│   ├── yamllint/
│   │   └── ...
│   └── zsh/
│       ├── .zshrc
│       ├── .zprofile
│       ├── 1.env.zsh
│       ├── 2.options.zsh
│       ├── 3.keybindings.zsh
│       ├── 4.functions.zsh
│       ├── 5.completion-styles.zsh
│       ├── 6.custom-completions.zsh
│       ├── 7.aliases.zsh
│       └── scripts/
```

## .chezmoi.yaml.tmpl

```yaml
{{ $email := promptStringOnce . "email" "Email address" -}}
{{ $machineType := promptChoiceOnce . "machineType" "Machine type" (list "personal" "work") -}}

data:
  email: {{ $email | quote }}
  machineType: {{ $machineType | quote }}
```

## .chezmoiignore

```
README.md
docs/

{{ if ne .chezmoi.os "darwin" }}
dot_config/aerospace
dot_config/ghostty
dot_config/kanata
dot_config/karabiner
dot_config/sketchybar
dot_config/skhd
dot_config/spacebar
dot_config/yabai
{{ end }}

{{ if ne .chezmoi.os "linux" }}
dot_config/hyprland
dot_config/waybar
{{ end }}
```

## Migration Phases

### Phase 1: Bootstrap

1. Back up existing chezmoi source: `mv ~/.local/share/chezmoi ~/.local/share/chezmoi.bak`
2. `chezmoi init` — creates fresh source repo
3. Add `.chezmoi.yaml.tmpl` and `.chezmoiignore`
4. Initial commit

### Phase 2: Migrate static configs (batch by batch)

Use `chezmoi add` from the live system (follows symlinks, captures actual deployed state).

**Batch 1 — Simple single-file configs:**
```sh
chezmoi add ~/.config/bat/config
chezmoi add ~/.config/direnv/direnvrc
chezmoi add ~/.config/yamllint/.yamllint.yml  # verify actual filename
chezmoi add ~/.config/aerospace/aerospace.toml
chezmoi add ~/.config/ghostty/config
```

**Batch 2 — Multi-file configs:**
```sh
chezmoi add ~/.config/tmux/
chezmoi add ~/.config/zsh/
chezmoi add ~/.config/nvim/        # this is lazyvim
chezmoi add ~/.config/oh-my-posh/
chezmoi add ~/.config/opencode/
chezmoi add ~/.config/karabiner/
chezmoi add ~/.config/sketchybar/
```

**Batch 3 — Private configs:**
```sh
chezmoi add --private ~/.config/btop/btop.conf
chezmoi add --private ~/.config/k9s/
```

**Batch 4 — Configs not deployed on this machine (Linux-only):**
These must be added manually from the dotfiles repo since they aren't in `~/.config/` on macOS.
```sh
# Manually copy from this repo into chezmoi source
cp -r ~/Projects/dotfiles/hyprland ~/.local/share/chezmoi/dot_config/hyprland
cp -r ~/Projects/dotfiles/waybar ~/.local/share/chezmoi/dot_config/waybar
```

**Batch 5 — Remaining configs:**
```sh
chezmoi add ~/.config/lazygit/
chezmoi add ~/.config/wezterm/
chezmoi add ~/.config/kanata/
chezmoi add ~/.config/skhd/
chezmoi add ~/.config/spacebar/
chezmoi add ~/.config/yabai/
```

Commit after each batch.

### Phase 3: Templates & secrets

1. Scan for hardcoded paths (`/Users/lrabello`, `/home/lrabello`)
2. Convert to templates using `{{ .chezmoi.homeDir }}`
3. Identify any secrets (API keys, tokens) and use `{{ onepasswordRead "op://vault/item/field" }}`
4. Rename templated files from `filename` to `filename.tmpl`

### Phase 4: Verify

1. `chezmoi diff` — should show no differences on the current machine
2. `chezmoi apply --dry-run` — preview what would happen
3. `chezmoi doctor` — verify chezmoi health
4. `chezmoi apply` — actually apply (replaces symlinks with managed files)
5. Restart shell, verify everything works

### Phase 5: Cleanup

1. Remove old symlinks that were replaced by chezmoi-managed files
2. Point chezmoi source repo to a GitHub remote
3. Remove or archive the old `~/Projects/dotfiles` repo
4. Remove `~/.local/share/chezmoi.bak`

## Risks & Mitigations

| Risk | Mitigation |
|---|---|
| `chezmoi apply` replaces symlinks | Preview with `diff`/`--dry-run` first |
| Losing uncommitted local changes | `chezmoi add` captures live state first |
| zsh breaks after migration | Keep old dotfiles repo as backup until verified |
| Linux configs can't be tested on macOS | Add from repo files, test on Linux machine later |
| 1Password not available on all machines | Use template conditionals to fall back gracefully |
