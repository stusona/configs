# Some useful aliases


# Navigation
alias ..='cd ..'


# update on one command
alias update='sudo apt-get update && sudo apt-get upgrade'
alias apt-get='sudo apt-get'
alias updatey="sudo apt-get --yes"


# reboot / halt / poweroff / suspend
alias reboot='sudo /sbin/reboot'
alias poweroff='sudo /sbin/poweroff'
alias halt='sudo /sbin/halt'
alias shutdown='sudo /sbin/shutdown'
# I'll be back
alias ibb='systemctl suspend'


# Colorize the grep command output for ease of use (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'


# handy short cuts
alias h='history'
alias j='jobs -l'


# Vi IMproved
alias vi='vim'

# do not delete / or prompt if deleting more than 3 files at a time
alias rm='rm -I --preserve-root'

# confirmation
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'
