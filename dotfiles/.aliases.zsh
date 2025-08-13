# Replace `cat` with `bat`
alias cat='bat'

# Replace `ls` with `eza`
alias ls='eza --icons=always --group-directories-first --classify=auto'
alias la='ls -A'
alias ll='ls -laF'
alias lsl='ls -lhF'

# Replace `find` with `fd`
alias find='fd'

# cp
alias cp='cp -r'

# mkdir
alias mkdir='mkdir -p'

# Replace `grep` with `rg`
alias grep='rg'

# Reload the config easily
alias r!='source ~/.zshrc'
alias sourceme='source ~/.zshrc'

# Gets a list of current ports
alias ports="sudo ss -tulanp"

# Get my current public IP
alias myip='dig +short myip.opendns.com @resolver1.opendns.com'

# Handy networking commands
alias pg="ping -c 5 google.com"
alias server="python -m http.server"

# Misc.
alias c="clear"
alias vi="vim"

# Fix Tmux
alias tmux='TERM=screen-256color-bce tmux'

# Source local aliases that we don't want in this repo
source ~/.aliases.local
