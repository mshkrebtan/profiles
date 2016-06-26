USERNAME="Maxie"

if [[ -z $USERNAME ]]; then
  USERNAME=$(id -F)
fi

echo "Welcome back, $USERNAME"

#########
# EXPORTS
#########

# Default editor
export EDITOR=vim

# Homebrew requirement
export PATH="/usr/local/sbin:${PATH}"

# Swift (open source)
export PATH="/Library/Developer/Toolchains/swift-latest.xctoolchain/usr/bin:${PATH}"

# Adding my own applications folder to PATH.
# To let the apps be executed by other users symlink everythnig to /usr/local/bin.
export PATH="~/Applications/bin:${PATH}"

# Python autocompletion
export PYTHONSTARTUP=~/.pythonrc

# Ruby gems
export PATH="~/.gem/ruby/2.0.0/bin:${PATH}"

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
alias darkmode="export THEME=dark"
alias lightmode="export THEME=light"
