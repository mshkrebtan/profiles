;; Load additional code
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
(load-file "~/.emacs.d/quail-diktor.el")


;; Global variables
(setq confirm-kill-emacs 'yes-or-no-p
      ring-bell-function 'ignore
      backup-directory-alist '(("." . "~/.emacs.d/backup"))
      backup-by-copying-when-linked t
      read-process-output-max (* 1024 1024)
      desktop-save 'if-exists
      ediff-split-window-function 'split-window-horizontally)


;; Buffer-local defaults
(setq-default require-final-newline t
              indent-tabs-mode nil
              js-indent-level 2
              ispell-program-name "aspell"
              fill-column 80)


;; Global modes
(server-mode 1)
(desktop-save-mode 1)
(size-indication-mode 1)
(column-number-mode 1)
(global-display-line-numbers-mode 1)
(delete-selection-mode 1)


;; Hooks
(add-hook 'before-save-hook 'delete-trailing-whitespace)


;; Packages
(require 'use-package)

(use-package gruvbox-theme
  :ensure t
  :config
  (load-theme 'gruvbox-light-hard t))


(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)
         ("C-x M-g" . magit-dispatch)))

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode))
  :init
  (setq markdown-command "/usr/local/bin/markdown")
  :hook ((markdown-mode . flyspell-mode)
         (markdown-mode . turn-on-auto-fill)
         (markdown-mode . display-fill-column-indicator-mode)))

(use-package terraform-mode
  :ensure t
  :commands terraform-mode
  :hook (terraform-mode . terraform-format-on-save-mode))

(use-package yaml-mode
  :ensure t
  :commands yaml-mode)

(use-package git-commit
  :ensure t
  :commands git-commit-mode)

(use-package rust-mode
  :ensure t
  :init
  (setq rust-format-on-save t)
  :commands rust-mode)

(use-package which-key
  :ensure t
  :config
  (which-key-mode 1))

(use-package flycheck
  :ensure t
  :init
  (setq flycheck-check-syntax-automatically '(mode-enabled save))
  :config
  (global-flycheck-mode 1))

(use-package flycheck-rust
  :ensure t
  :requires flycheck
  :hook (rust-mode . flycheck-rust-setup))

(use-package company
  :ensure t
  :init
  (setq company-dabbrev-downcase nil)
  :config
  (global-company-mode 1))

(use-package lsp-mode
  :ensure t
  :requires (flycheck company)
  :init
  (setq lsp-keymap-prefix "s-l")
  (setq lsp-rust-server 'rust-analyzer)
  :hook ((rust-mode . lsp)
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)
