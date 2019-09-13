# Setup fzf
# ---------
if [[ ! "$PATH" == */home/adam/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/adam/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/adam/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/adam/.fzf/shell/key-bindings.bash"
