# Set locale to UTF-8. Programs like Vim and Emacs will use LANG for encoding
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# https://docs.brew.sh/Shell-Completion#configuring-completions-in-zsh
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi

# Autoload zsh functions
autoload -Uz colors && colors
autoload -Uz vcs_info
autoload -Uz select-word-style && select-word-style bash
autoload -Uz add-zsh-hook
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line

# Set VCS Information and Tab-RS in PROMPT
zstyle ':vcs_info:*' enable git

setopt prompt_subst

# kube-ps1
source "$(brew --prefix)/opt/kube-ps1/share/kube-ps1.sh"

PROMPT=$'%B%n@%m %3~ $(kube_ps1)${vcs_info_msg_0_}%b\n%# '

if (($+TAB)); then
  PROMPT="%{$fg_bold[green]%}(tab)-[${TAB}]-%{$reset_color%}${PROMPT}"
fi

# Print the shell title
add-zsh-hook -Uz precmd () { print -Pn "\e]2;%3~\a"; vcs_info }

# Install direnv hook
# https://github.com/direnv/direnv
eval "$(direnv hook zsh)"

# Aliases
alias ll="ls -alpGh"
alias l="ls -lpGh"

# prevent several of the system-supplied programs (including tar) from giving
# special meaning to ._* archive members
export COPYFILE_DISABLE=1

# Other parameters
export GREP_OPTIONS='--color=auto'
export GPG_TTY="$(tty)"
export EDITOR=emacsclient

# Aliases
alias e='emacsclient -n'
alias k='kubectl'
alias tf='terraform'

# OpenJDK
PATH="/opt/homebrew/opt/openjdk/bin:${PATH}"

# Golang
export GOPATH="${HOME}/go"
PATH="${PATH}:${GOPATH}/bin"

# Rancher
PATH="${PATH}:${HOME}/.rd/bin"

# MacTeX
PATH="${PATH}:/usr/local/texlive/2024/bin/universal-darwin"

export PATH
