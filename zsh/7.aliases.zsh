if (( $+commands[eza] )); then
  alias ls="eza --icons"
  alias ll="eza --icons --git -lahb"
  alias lt="eza --icons -TL 2"
fi

(( $+commands[bat] )) && alias cat="bat"
(( $+commands[btop] )) && alias top="btop"

alias lg="lazygit"
alias ld="lazydocker"
alias nv="nvim"
alias mkdir="mkdir -pv"
alias cp="cp -iv"
alias mv="mv -iv"
alias rm="rm -Iv"


alias prs="$SCRIPT_DIR/prs.sh"
