#!/bin/sh

# Check the OS and print the corresponding icon
case "$(uname -s)" in
    Darwin)
        result=""  # Apple icon
        ;;
    Linux)
        if [ -f /etc/arch-release ]; then
            result=""  # Arch Linux icon
        else
            result=""  # Generic Linux icon
        fi
        ;;
    *)
        result=""  # Unknown OS icon
        ;;
esac

tmux set -g @os_icon "$result"
