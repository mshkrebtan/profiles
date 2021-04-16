EMACS_HOME = "${HOME}/.emacs.d"
DIKTOR_HOME = "${HOME}/.config/diktor"

emacs_files := $(addprefix $(EMACS_HOME)/, custom.el early-init.el init.el quail-diktor.el use-package)

$(emacs_files): $(DIKTOR_HOME)/.emacs.d/quail-diktor.el
	touch $(EMACS_HOME)/custom.el
	ln -sf "${PWD}/emacs/.emacs.d/init.el" $(EMACS_HOME)/
	ln -sf "${PWD}/emacs/.emacs.d/early-init.el" $(EMACS_HOME)/
	ln -sf "$(DIKTOR_HOME)/.emacs.d/quail-diktor.el" $(EMACS_HOME)/
	git clone https://github.com/jwiegley/use-package.git $(EMACS_HOME)/use-package || [ -d $(EMACS_HOME)/use-package ]

$(DIKTOR_HOME)/.emacs.d/quail-diktor.el:
	 git clone https://github.com/mshkrebtan/diktor.git $(DIKTOR_HOME) || [ -f $@ ]
