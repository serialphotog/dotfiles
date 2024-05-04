# ls
alias ls='ls --color=auto'
alias la='ls -A'
alias ll='ls -laF'
alias lsl='ls -lhF'

# Path aliases
alias dotfiles='cd ~/.dotfiles'
alias dev='cd ~/dev'
alias downloads='cd ~/Downloads'
alias desktop='cd ~/Desktop'
alias documents='cd ~/Documents'
alias pictures='cd ~/Pictures'

# cd
alias ..='cd ..'
alias ...'cd ../..'
alias ....='cd ../../..'
alias ~='cd ~'

# cp
alias cp='cp -r'

# mkdir
alias mkdir='mkdir -p'

# grep
alias grep='grep --color=auto'
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"

# Reload the config easily
alias r!='source ~/.zshrc'

# Gets alist of current ports
alias ports="sudo netstat -tulanp"

# Handy networking commands
alias pg="ping -c 5 google.com"
alias server="python -m http.server"

# Misc.
alias c="clear"
alias vi="vim"

# Tor
alias starttor='sudo systemctl start tor.service'
alias stoptor='sudo systemctl stop tor.service'

# Arch Linux Stuffs
alias cleancache='yay -Scc'
alias rankmirrors='eos-rankmirrors'

# Source local aliases that we don't want in this repo
source ~/.aliases.local
