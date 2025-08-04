# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi

alias unlock="rm -f /var/home/sstendahl/.var/app/com.jetbrains.PyCharm-Professional/config/JetBrains/PyCharm2025.1/.lock"
alias just="ujust"
alias please='sudo $(history -p !!)'

alias ls='ls --color=auto --group-directories-first'
alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -CF'
alias lt='ls -alFht'  # Sort by time, newest first
alias lz='ls -alFhS'  # Sort by size, largest first
alias ld='ls -d */'   # List directories only
alias l.='ls -d .*'   # List hidden files only
alias lx='ls -lXB'    # Sort by extension
alias lk='ls -lSr'    # Sort by size, smallest first

# Archive operations
alias tarz='tar -czf'
alias tarx='tar -xzf'
alias tarlist='tar -tzf'

unset rc
