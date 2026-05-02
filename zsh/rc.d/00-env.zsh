[[ "$TERM" == "xterm-ghostty" ]] && export TERM=xterm-256color
export FZF_DEFAULT_OPTS="--walker-skip=bin,obj"

HISTSIZE=15000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE

ZOXIDE_CMD_OVERRIDE="cd"

DOTNET_CLI_TELEMETRY_OPTOUT=1
DOTNET_VERSION="$(mise current dotnet)"
MSBuildSDKsPATH="$DOTNET_ROOT/sdk/$DOTNET_VERSION/Sdks"
export UseSharedCompilation=false

export COPILOT_CUSTOM_INSTRUCTIONS_DIRS="$HOME/.agents"
