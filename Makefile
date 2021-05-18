EMACS_HOME = "${HOME}/.emacs.d"
DIKTOR_HOME = "${HOME}/.config/diktor"
ALACRITTY_HOME = "${HOME}/.config/alacritty"
ZDOTDIR = "${HOME}"

.PHONY: alacritty emacs zsh

emacs_files := $(addprefix $(EMACS_HOME)/, custom.el early-init.el init.el quail-diktor.el use-package)
emacs : $(emacs_files)

$(EMACS_HOME)/custom.el :
	touch "$@"
$(EMACS_HOME)/early-init.el :
	ln -sf "${PWD}/emacs/.emacs.d/early-init.el" "$@"
$(EMACS_HOME)/init.el :
	ln -sf "${PWD}/emacs/.emacs.d/init.el" "$@"
$(EMACS_HOME)/quail-diktor.el :  $(DIKTOR_HOME)/.emacs.d/quail-diktor.el
	ln -sf "$(DIKTOR_HOME)/.emacs.d/quail-diktor.el" "$@"
$(EMACS_HOME)/use-package :
	[ -d "$@" ] || git clone https://github.com/jwiegley/use-package.git "$@"
$(DIKTOR_HOME)/.emacs.d/quail-diktor.el :
	[ -f "$@" ] || git clone https://github.com/mshkrebtan/diktor.git "$(DIKTOR_HOME)"

alacritty : $(ALACRITTY_HOME)

$(ALACRITTY_HOME) :
	ln -sfT "${PWD}/alacritty" "$@"
zsh : $(ZDOTDIR)/.zshrc

$(ZDOTDIR)/.zshrc :
	ln -sf "${PWD}/zsh/.zshrc" "$@"
