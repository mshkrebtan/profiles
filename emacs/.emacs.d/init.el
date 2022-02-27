;; Load additional files
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(load-file "~/.emacs.d/quail-diktor.el")

(eval-when-compile
  (add-to-list 'load-path "~/.emacs.d/use-package")
  (require 'use-package))


;; Set global variables
(setq
 backup-by-copying-when-linked t
 backup-directory-alist '(("." . "~/.emacs.d/backup"))
 calendar-latitude 52.5
 calendar-longitude 13.4
 calendar-location-name "Berlin, Germany"
 completion-styles '(flex)
 completions-format 'vertical
 confirm-kill-emacs 'yes-or-no-p
 desktop-save 'if-exists
 ediff-split-window-function 'split-window-horizontally
 exec-path (append '("/usr/local/bin/") exec-path)
 org-agenda-files '("~/org"
                    "~/work")
 org-agenda-show-all-dates nil
 org-agenda-show-future-repeats 'next
 org-agenda-span 'year
 org-agenda-tags-column -80
 org-agenda-todo-list-sublevels nil
 org-clock-idle-time 1
 org-clock-persist t
 org-default-notes-file "capture.org"
 org-goto-auto-isearch nil
 org-log-into-drawer t
 read-buffer-completion-ignore-case t
 read-file-name-completion-ignore-case t
 save-interprogram-paste-before-kill t
 vc-follow-symlinks nil
 ring-bell-function 'ignore)


;; Set defaults
(setq-default
 fill-column 80
 indent-tabs-mode nil
 js-indent-level 2
 require-final-newline t
)


;; Enable certain functions
(put 'scroll-left 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)


;; Set environment variables
(setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))
(setenv "SSH_AUTH_SOCK" (expand-file-name "~/.ssh/ssh-agent"))


;; Set key bindings
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c l") 'org-store-link)


;; Enable global modes
(server-mode 1)
(desktop-save-mode 1)
(size-indication-mode 1)
(column-number-mode 1)
(global-display-line-numbers-mode 1)
(show-paren-mode 1)
(electric-pair-mode 1)
(delete-selection-mode 1)
(icomplete-mode 1)


;; Set up hooks for clock persistence
(org-clock-persistence-insinuate)


;; Add hooks
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'org-mode-hook 'turn-on-auto-fill)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)
(add-hook 'prog-mode-hook 'turn-on-auto-fill)
(add-hook 'prog-mode-hook 'display-fill-column-indicator-mode)
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'xwidget-webkit-mode-hook (lambda () (display-line-numbers-mode -1)))


;; Configure ispell
(with-eval-after-load "ispell"
  (setq ispell-program-name "hunspell")
  (setq ispell-dictionary "en_GB,ru_RU,de_DE")
  ;; ispell-set-spellchecker-params has to be called
  ;; before ispell-hunspell-add-multi-dic will work
  (ispell-set-spellchecker-params)
  (ispell-hunspell-add-multi-dic "en_GB,ru_RU,de_DE")
  ;; For saving words to the personal dictionary, don't infer it from
  ;; the locale, otherwise it would save to ~/.hunspell_en_GB.
  (setq ispell-personal-dictionary "~/.hunspell_personal"))


;; Packages
(use-package modus-themes
  :ensure
  :init
  (setq modus-themes-syntax '(faint alt-syntax))
  (modus-themes-load-themes)
  :config
  (modus-themes-load-operandi))

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
  :hook ((gfm-mode . turn-on-auto-fill)
         (gfm-mode . display-fill-column-indicator-mode)))


(use-package grip-mode
  :ensure t
  :commands grip-mode
  :init
  (load-file "~/.emacs.d/grip-mode-sensitive.el")
  :hook (markdown-mode . grip-mode))

(use-package terraform-mode
  :ensure t
  :commands terraform-mode
  :hook (terraform-mode . terraform-format-on-save-mode))

(use-package yaml-mode
  :ensure t
  :commands yaml-mode)

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
  (setq company-dabbrev-code-everywhere t
        company-dabbrev-code-other-buffers t
        company-dabbrev-code-modes '(prog-mode
                                     batch-file-mode
                                     csharp-mode
                                     css-mode
                                     erlang-mode
                                     haskell-mode
                                     jde-mode
                                     lua-mode
                                     python-mode
                                     yaml-mode))
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
  :requires company-graphviz-dot
  :init
  (setq graphviz-dot-indent-width 4)
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
