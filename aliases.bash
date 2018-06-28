# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# OWN ALIASES
alias ns='nmap -sP 192.168.129.0/24'
alias nsd='nmap -sP 192.168.129.0/24 | grep dragonfly'
alias sc='source ~/catkin_ws/devel/setup.bash'
alias sb='source ~/.bashrc'
alias upgrade='sudo apt-get update && sudo apt-get upgrade'
alias sshp='sshpass -p ''linaro'' ssh -Y -R 52698:localhost:52698 dragonfly15@dragonfly15'
alias sftpp='sshpass -p ''linaro'' sftp dragonfly15@dragonfly15'
alias pingb='ping dragonfly15'
alias install='sudo apt-get install -y'
alias please='sudo "$BASH" -c "$(history -p !!)"'
