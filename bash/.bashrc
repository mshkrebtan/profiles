# Aliases
# -----------------------------------------------------------------------------
alias ll="ls -alpGh"
alias l="ls -lpGh"
# -----------------------------------------------------------------------------
# end Aliases

# Set locale to UTF-8
# Programs like Vim will use LANG for encoding
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Git in Bash
source ~/.git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
PS1='\[\033[01m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W$(__git_ps1 " (%s)")\[\033[00m\]\n\$ '

# Bash Completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

# PATH
# -----------------------------------------------------------------------------
# Add Go tree to PATH
export PATH=$PATH:/usr/local/go/bin

# Add Cargo tree to PATH
export PATH="$HOME/.cargo/bin:$PATH"

export PATH="/usr/local/sbin:$PATH"
# -----------------------------------------------------------------------------
# end PATH

# prevent several of the system-supplied programs (including tar) from giving
# special meaning to ._* archive members
export COPYFILE_DISABLE=1

# Other parameters
export EDITOR=vim
export GREP_OPTIONS='--color=auto'
