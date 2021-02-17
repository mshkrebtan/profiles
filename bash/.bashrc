# Aliases
# -----------------------------------------------------------------------------
alias ll="ls -alpGh"
alias l="ls -lpGh"
# -----------------------------------------------------------------------------
# end Aliases

# Set locale to UTF-8
# Programs like Vim and Emacs will use LANG for encoding
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

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
# Add Go tree
PATH=$PATH:/usr/local/go/bin

# Add Cargo tree
PATH="$HOME/.cargo/bin:$PATH"

PATH="/usr/local/sbin:$PATH"

# Add rbenv shims
PATH="~/.rbenv/shims:$PATH"
export PATH
# -----------------------------------------------------------------------------
# end PATH

# prevent several of the system-supplied programs (including tar) from giving
# special meaning to ._* archive members
export COPYFILE_DISABLE=1

# Other parameters
export GREP_OPTIONS='--color=auto'
export GPG_TTY="$(tty)"
export EDITOR=emacsclient

complete -C /usr/local/bin/terraform terraform
complete -C /usr/local/bin/vault vault

if [ -f '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc' ]; then
  source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc'
fi

if [ -f '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc' ]; then
  source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc'
fi
