EMACS_HOME = "${HOME}/.emacs.d"
DIKTOR_HOME = "${HOME}/.config/diktor"
ALACRITTY_HOME = "${HOME}/.config/alacritty"
TMUX_HOME = "${HOME}"
ZDOTDIR = "${HOME}"
LAUNCH_AGENTS_HOME = "${HOME}/Library"

PHONY: alacritty emacs zsh tmux launch_agents git

emacs_files := $(addprefix $(EMACS_HOME)/, custom.el early-init.el init.el grip-mode-sensitive.el quail-diktor.el use-package)

hunspell_dictionaries := $(addprefix $(HOME)/Library/Spelling/, en_GB.aff en_GB.dic ru_RU.aff ru_RU.dic de_DE.aff de_DE.dic)

emacs : $(emacs_files) $(hunspell_dictionaries)

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

$(HOME)/Library/Spelling/en_GB.aff:
	curl -fsSL https://cgit.freedesktop.org/libreoffice/dictionaries/plain/en/en_GB.aff -o "$@"
$(HOME)/Library/Spelling/en_GB.dic:
	curl -fsSL https://cgit.freedesktop.org/libreoffice/dictionaries/plain/en/en_GB.dic -o "$@"
$(HOME)/Library/Spelling/ru_RU.aff:
	curl -fsSL https://cgit.freedesktop.org/libreoffice/dictionaries/plain/ru_RU/ru_RU.aff -o "$@"
$(HOME)/Library/Spelling/ru_RU.dic:
	curl -fsSL https://cgit.freedesktop.org/libreoffice/dictionaries/plain/ru_RU/ru_RU.dic -o "$@"
$(HOME)/Library/Spelling/de_DE.aff:
	curl -fsSL https://cgit.freedesktop.org/libreoffice/dictionaries/plain/de/de_DE_frami.aff -o "$@"
$(HOME)/Library/Spelling/de_DE.dic:
	curl -fsSL https://cgit.freedesktop.org/libreoffice/dictionaries/plain/de/de_DE_frami.dic -o "$@"

git_files := $(addprefix $(HOME)/, .gitconfig .gitignore_global)
git : $(git_files)

$(HOME)/.gitconfig:
	ln -sf "${PWD}/git/.gitconfig" "$@"
$(HOME)/.gitignore_global:
	ln -sf "${PWD}/git/.gitignore_global" "$@"

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

packages := cmake libtool direnv hunspell markdown ripgrep fd teleport kubeseal jq
