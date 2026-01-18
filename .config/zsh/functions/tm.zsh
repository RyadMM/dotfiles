# =============================================================================
# TMUX SESSION FUNCTION
# =============================================================================
# Quick tmux session management - attach to or create "main" session.
#
# USAGE: tm
#   - If session "main" exists: attach to it
#   - If session "main" doesn't exist: create it
#
# WHY: Typing "tm" is faster than "tmux new -A -s main" and provides a
# consistent default session name across all machines.
# =============================================================================
tm() { tmux new -A -s main; }
