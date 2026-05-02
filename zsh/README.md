# zsh startup order (login & interactive)
1. zshenv
2. zprofile
3. zshrc
4. zlogin

## Bootstrap symlinks

Create the expected links in `ZDOTDIR` (or `XDG_CONFIG_HOME/zsh` when `ZDOTDIR` is unset):

```sh
./zsh/scripts/link-zdotdir.sh
```

## Interactive config modules

`zshrc` sources drop-in modules from `rc.d/*.zsh` in lexicographic order. Use numeric prefixes to make load order explicit:

```text
00-env.zsh
10-options.zsh
20-functions.zsh
30-keybindings.zsh
40-completion-styles.zsh
50-custom-completions.zsh
90-aliases.zsh
```
