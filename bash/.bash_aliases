# ls options
# -a    Include directory entries whose names begin with a dot (.).
# -l    List in long format.
# -p    Write a slash (`/') after each filename if that file is a directory.
# -h    Use unit suffixes: Byte, Kilobyte, Megabyte, Gigabyte, Terabyte and Petabyte.

alias ll="ls -alpGh"
alias l="ls -lpGh"

alias escape="sed 's/\ /\\\ /g; s/[(]/\\\(/g; s/[)]/\\\)/g; s/\[/\\\[/g; s/\]/\\\]/g'"
