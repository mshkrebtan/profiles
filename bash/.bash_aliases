# ls options:
# -A    do not list implied . and ..
# -l    use a long listing format
# -h    with -l and/or -s, print human readable sizes (e.g., 1K 234M 2G)
# -F    append indicator (one of */=>@|) to entries
alias ll='ls -AlhF'
alias l='ls -lhF'

alias escape="sed 's/\ /\\\ /g; s/[(]/\\\(/g; s/[)]/\\\)/g; s/\[/\\\[/g; s/\]/\\\]/g'"
