USERNAME="Maxie"
echo "Welcome back, $USERNAME"

# Adding my own applications folder to PATH.
# To let the apps be executed by other users symlink everythnig to /usr/local/bin.
export PATH=~/Applications/bin:"${PATH}"

# Homebrew requirement
export PATH="/usr/local/sbin:${PATH}"

# Autocompletion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
  fi

# One-time symlink for airport utility
if [[ ! -f /usr/local/bin/airport ]]; then
  ln -s "/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport" /usr/local/bin/airport
fi

# Alias for colored ls output
alias ls="ls -1pG"
alias ll="ls -lapGh"

# Default editor
export EDITOR=nano

# Swift (open source)
export PATH=/Library/Developer/Toolchains/swift-latest.xctoolchain/usr/bin:"${PATH}"

# Torch
# . /Users/mshkrebtan/Applications/torch/install/bin/torch-activate

# Python autocomplete
export PYTHONSTARTUP=~/.pythonrc

# Docker
eval $(docker-machine env)
