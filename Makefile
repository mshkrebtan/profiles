EMACS_HOME = "${HOME}/.emacs.d"
DIKTOR_HOME = "${HOME}/.config/diktor"
ALACRITTY_HOME = "${HOME}/.config/alacritty"
TMUX_HOME = "${HOME}"
ZDOTDIR = "${HOME}"
LAUNCH_AGENTS_HOME = "${HOME}/Library"

.PHONY: alacritty emacs zsh tmux launch_agents

emacs_files := $(addprefix $(EMACS_HOME)/, custom.el early-init.el init.el grip-mode-sensitive.el quail-diktor.el use-package)
emacs : $(emacs_files)

$(EMACS_HOME)/custom.el :
	touch "$@"
$(EMACS_HOME)/early-init.el :
	ln -sf "${PWD}/emacs/.emacs.d/early-init.el" "$@"
$(EMACS_HOME)/init.el :
	ln -sf "${PWD}/emacs/.emacs.d/init.el" "$@"
$(EMACS_HOME)/grip-mode-sensitive.el :
	ln -sf "${PWD}/emacs/.emacs.d/grip-mode-sensitive.el" "$@"
$(EMACS_HOME)/quail-diktor.el :  $(DIKTOR_HOME)/.emacs.d/quail-diktor.el
	ln -sf "$(DIKTOR_HOME)/.emacs.d/quail-diktor.el" "$@"
$(EMACS_HOME)/use-package :
	[ -d "$@" ] || git clone https://github.com/jwiegley/use-package.git "$@"
$(DIKTOR_HOME)/.emacs.d/quail-diktor.el :
	[ -f "$@" ] || git clone https://github.com/mshkrebtan/diktor.git "$(DIKTOR_HOME)"

alacritty : $(ALACRITTY_HOME)
$(ALACRITTY_HOME) :
	ln -sf "${PWD}/alacritty" "$@"

zsh : $(ZDOTDIR)/.zshrc
$(ZDOTDIR)/.zshrc :
	ln -sf "${PWD}/zsh/.zshrc" "$@"

tmux : $(TMUX_HOME)/.tmux.conf
$(TMUX_HOME)/.tmux.conf :
	ln -sf "${PWD}/tmux/.tmux.conf" "$@"

launch_agents:
	for plist in LaunchAgents/*; do\
		ln -sf "${PWD}/$${plist}" "$(LAUNCH_AGENTS_HOME)/$${plist}";\
	done

packages := direnv hunspell markdown ripgrep fd teleport kubeseal jq
