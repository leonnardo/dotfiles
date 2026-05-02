# completes aliases as distinct commands (enables completion for aliased commands)
setopt complete_aliases

# enables command correction/suggestion
setopt correct

# Allows comments in interactive shell using `#`
setopt interactivecomments

# enables filename expansion after = in arguments (e.g., `--option=~/path`)
setopt magicequalsubst

# prevents errors when no files match a glob pattern
setopt nonomatch

# notify the user of background job completions immediately
setopt notify

# sorts filenames with numeric parts in a way that makes sense to humans (e.g., file2 before file10)
setopt numericglobsort

# allows command substitution in prompts
setopt promptsubst

# append to the history file, don't overwrite it
setopt appendhistory

# enables real-time history sharing between all active zsh sessions
setopt sharehistory

# commands that start with a space character are not saved to history
setopt hist_ignore_space

# removes older duplicate entries from history when a new duplicate is added
setopt hist_ignore_all_dups

# prevents duplicate entries from being written to the history fil
setopt hist_save_no_dups

# prevents duplicate entries from being written to the history file
setopt hist_ignore_dups

# when searching through history (Ctrl+R), skips duplicate entries
setopt hist_find_no_dups
