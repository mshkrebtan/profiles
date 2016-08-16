if [ "$(uname -s)" == "Linux" ]; then
    alias ll='ls -alhF'
    alias la='ls -1Ap'
    alias l='ls -1Fp'
    alias pbcopy='xclip -selection clipboard'
    alias pbpaste='xclip -selection clipboard -o'
elif [ "$(uname -s)" == "Darwin" ]; then
    alias ls="ls -G"
    alias ll="ls -alpGh"
    alias la="ls -1pA"
    alias l="ls -1p"
fi


alias darkmode="export THEME=dark TMUX_THEME=tomorrow-night"
alias lightmode="export THEME=light TMUX_THEME=tomorrow"

alias escape="sed 's/\ /\\\ /g; s/[(]/\\\(/g; s/[)]/\\\)/g; s/\[/\\\[/g; s/\]/\\\]/g'"
