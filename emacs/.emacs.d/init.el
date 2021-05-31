;; Load additional code
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
(load-file "~/.emacs.d/quail-diktor.el")

(eval-when-compile
  (add-to-list 'load-path "~/.emacs.d/use-package")
  (require 'use-package))

;; Set variables
(setq-default
 backup-by-copying-when-linked t
 backup-directory-alist '(("." . "~/.emacs.d/backup"))
 completions-format 'vertical
 confirm-kill-emacs 'yes-or-no-p
 desktop-save 'if-exists
 ediff-split-window-function 'split-window-horizontally
 exec-path (append '("/usr/local/bin/") exec-path)
 fill-column 80
 indent-tabs-mode nil
 js-indent-level 2
 mode-require-final-newline 'visit-save
 org-goto-auto-isearch nil
 read-process-output-max (* 1024 1024)
 require-final-newline 'visit-save
 ring-bell-function 'ignore
 save-interprogram-paste-before-kill t
 vc-follow-symlinks nil)

(put 'scroll-left 'disabled nil)

(setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))
(setenv "SSH_AUTH_SOCK" (expand-file-name "~/.ssh/ssh-agent"))



;; Global modes
(server-mode 1)
(desktop-save-mode 1)
(size-indication-mode 1)
(column-number-mode 1)
(global-display-line-numbers-mode 1)
(show-paren-mode 1)
(electric-pair-mode 1)
(delete-selection-mode 1)
(icomplete-mode 1)


;; Hooks
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'xwidget-webkit-mode-hook (lambda () (display-line-numbers-mode -1)))
(add-hook 'org-mode-hook 'turn-on-auto-fill)

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
  (setq markdown-command "markdown")
  :hook ((markdown-mode . flyspell-mode)
         (markdown-mode . turn-on-auto-fill)
         (markdown-mode . display-fill-column-indicator-mode)))

(use-package terraform-mode
  :ensure t
  :commands terraform-mode
  :hook (terraform-mode . terraform-format-on-save-mode))

(use-package yaml-mode
  :ensure t
  :commands yaml-mode
  :hook (yaml-mode . display-fill-column-indicator-mode))

(use-package git-commit
  :ensure t
  :commands git-commit-mode
  :config
  (global-git-commit-mode t)
  :hook (git-commit-setup . git-commit-turn-on-flyspell))

(use-package gitignore-mode
  :ensure t
  :commands gitignore-mode)

(use-package rust-mode
  :ensure t
  :init
  (setq rust-format-on-save t)
  :commands rust-mode
  :hook (rust-mode . display-fill-column-indicator-mode))

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
  (setq-default company-dabbrev-downcase nil)
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

(use-package json-mode
  :ensure t
  :commands json-mode)

(use-package dockerfile-mode
  :ensure t
  :commands dockerfile-mode)

(use-package graphviz-dot-mode
  :ensure t
  :commands graphviz-dot-mode)

(use-package csv-mode
  :ensure t
  :commands csv-mode)

(use-package jinja2-mode
  :ensure t
  :commands jinja2-mode)

(use-package highlight-indent-guides
  :ensure t
  :hook (yaml-mode . highlight-indent-guides-mode))

(use-package pinentry
  :ensure t
  :config
  (pinentry-start))
