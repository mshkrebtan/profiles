## set status bar
set -g status-bg "#444444"
set -g status-fg "#dadada"

## highlight active window
setw -g window-status-current-bg "#1c1c1c"
setw -g window-status-current-fg "#d7d787"

## highlight activity in status bar
setw -g window-status-activity-bg "#d7d787"
setw -g window-status-activity-fg "#444444"

## pane border and colors
#set -g pane-active-border-bg "#1c1c1c"
set -g pane-active-border-bg default
set -g pane-active-border-fg "#d7d787"
#set -g pane-border-bg "#1c1c1c"
set -g pane-border-bg default
set -g pane-border-fg "#444444"

set -g clock-mode-colour "#d7d787"
set -g clock-mode-style 24
