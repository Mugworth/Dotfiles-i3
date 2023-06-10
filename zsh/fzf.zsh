# Setup fzf
# ---------
if [[ ! "$PATH" == *$HOME/git/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}$HOME/git/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$HOME/git/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "$HOME/git/fzf/shell/key-bindings.zsh"
