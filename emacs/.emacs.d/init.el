(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(require 'use-package)


;; Global variables
(setq confirm-kill-emacs 'yes-or-no-p
      ring-bell-function 'ignore
      custom-file "~/.emacs.d/custom.el"
      backup-directory-alist '(("." . "~/.emacs.d/backup"))
      backup-by-copying-when-linked t)


;; Buffer-local defaults
(setq-default require-final-newline t
              indent-tabs-mode nil
              js-indent-level 2
              ispell-program-name "aspell"
              fill-column 80)


;; Frame defaults
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(add-to-list 'default-frame-alist '(font . "JetBrains Mono-14"))
(add-to-list 'default-frame-alist '(line-spacing . 0.2))


;; Global modes
(server-mode 1)
(tool-bar-mode -1)
(size-indication-mode 1)
(column-number-mode 1)
(global-display-line-numbers-mode 1)
(global-display-fill-column-indicator-mode 1)
(delete-selection-mode 1)


;; Hooks
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(add-hook 'text-mode-hook 'visual-line-mode)
(add-hook 'text-mode-hook (lambda ()
                            (display-fill-column-indicator-mode -1)))


;; Packages
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
  :hook ((markdown-mode . turn-on-auto-fill)
         (markdown-mode . flyspell-mode)))

(use-package terraform-mode
  :ensure t
  :hook (terraform-mode . terraform-format-on-save-mode))

(use-package git-commit
  :ensure t)

(use-package rust-mode
  :ensure t
  :init
  (setq rust-format-on-save t))

(use-package which-key
  :ensure t
  :config
  (which-key-mode 1))

(use-package flycheck
  :ensure t
  :config
  (global-flycheck-mode 1))

(use-package flycheck-rust
  :ensure t
  :requires flycheck
  :hook (rust-mode . flycheck-rust-setup))

(use-package company
  :ensure t
  :config
  (global-company-mode 1))

(use-package lsp-mode
  :ensure t
  :requires (flycheck company)
  :init
  (setq lsp-keymap-prefix "s-l")
  :hook ((rust-mode . lsp)
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

(use-package lsp-ui
  :ensure t
  :requires lsp-mode
  :commands lsp-ui-mode)

;; Load additional code
(load-file "~/.emacs.d/quail-diktor.el")
(load-theme 'gruvbox-light-hard t)
(load custom-file)
