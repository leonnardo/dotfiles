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
