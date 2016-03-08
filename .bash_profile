USERNAME="Maxie"
echo "Welcome back, $USERNAME"

#########
# EXPORTS
#########

# Adding my own applications folder to PATH.
# To let the apps be executed by other users symlink everythnig to /usr/local/bin.
export PATH=~/Applications/bin:"${PATH}"

# Homebrew requirement
export PATH="/usr/local/sbin:${PATH}"

# Swift (open source)
export PATH=/Library/Developer/Toolchains/swift-latest.xctoolchain/usr/bin:"${PATH}"

# Default editor
export EDITOR=nano

# Python autocompletion
export PYTHONSTARTUP=~/.pythonrc

######################
# OTHER CUSTOMIZATIONS
######################

# Autocompletion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

# Aliases for colored ls output
alias ls="ls -1pG"
alias ll="ls -lapGh"
