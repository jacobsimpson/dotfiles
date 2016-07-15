#
# Ideas.
# 1. Unified constantly shared history.
#   - but by default you only search the history in your session, or maybe the
#   history in your session first
# 2. History entries are tracked by session id (maybe shell pid, but that seems
# insufficiently unique.)
# 3. Directory where the command was executed.
# 4. Result Code would be great.
# 5. Even total output for smaller commands or just recent history would be
# nice.
#

zshaddhistory() {
    # prepend the current epoch time
    # $1 includes terminating newline already (see zshmisc(1))
    echo -n "$(date "+%s") $$ $(pwd) $1" >> "$HOME/.zsh_extended_history"
}
