;; Load additional files
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(load-file "~/.emacs.d/quail-diktor.el")

(eval-when-compile
  (require 'use-package))

;; Set global variables
(setq
 auto-save-file-name-transforms nil
 backup-by-copying-when-linked t
 backup-directory-alist '(("." . "~/.emacs.d/backup"))
 calendar-latitude 52.5
 calendar-longitude 13.4
 calendar-location-name "Berlin, Germany"
 completion-styles '(flex)
 completions-format 'one-column
 confirm-kill-emacs 'yes-or-no-p
 csv-separators '(";" "	")
 desktop-save 'if-exists
 ediff-split-window-function 'split-window-horizontally
 exec-path (append '("/opt/homebrew/bin") exec-path)
 flyspell-issue-message-flag nil
 org-agenda-files '("~/org"
                    "~/work")
 org-agenda-show-all-dates nil
 org-agenda-show-future-repeats 'next
 org-agenda-span 'year
 org-agenda-tags-column -80
 org-agenda-todo-ignore-scheduled t
 org-agenda-todo-list-sublevels nil
 org-clock-idle-time 1
 org-clock-persist t
 org-default-notes-file "capture.org"
 org-export-backends '(md)
 org-goto-auto-isearch nil
 org-log-into-drawer t
  read-buffer-completion-ignore-case t
 read-file-name-completion-ignore-case t
 ring-bell-function 'ignore
 save-interprogram-paste-before-kill t
 vc-follow-symlinks nil
 what-cursor-show-names t)

(with-eval-after-load "grep"
  (add-to-list 'grep-find-ignored-directories ".terraform"))

;; Set defaults
(setq-default
 fill-column 80
 indent-tabs-mode nil
 js-indent-level 2
 require-final-newline t
)

;; Enable certain functions
(put 'dired-find-alternate-file 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'scroll-left 'disabled nil)


;; Set environment variables
;; (setenv "SSH_AUTH_SOCK" (expand-file-name "~/.ssh/ssh-agent"))
(setenv "LANG" "en_GB.UTF-8")
(setenv "PATH"
        (concat
         "/opt/homebrew/bin" path-separator
         (getenv "PATH")))

(add-to-list 'Info-directory-list' "/opt/homebrew/share/info")

;; Set key bindings
(global-set-key "\C-c\C-z." 'browse-url-at-point)
(global-set-key "\C-c\C-zb" 'browse-url-of-buffer)
(global-set-key "\C-c\C-zr" 'browse-url-of-region)
(global-set-key "\C-c\C-zu" 'browse-url)
(global-set-key "\C-c\C-zv" 'browse-url-of-file)
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
(add-hook 'conf-mode-hook (lambda () (setq indent-line-function 'insert-tab)))
(add-hook 'org-mode-hook 'turn-on-auto-fill)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)
(add-hook 'prog-mode-hook 'turn-on-auto-fill)
(add-hook 'prog-mode-hook 'display-fill-column-indicator-mode)
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'xwidget-webkit-mode-hook (lambda () (display-line-numbers-mode -1)))
(add-hook 'rust-mode-hook (lambda () (setq  fill-column 100)))

;; Configure ispell
(with-eval-after-load "ispell"
  (setq ispell-program-name "/opt/homebrew/bin/hunspell")
  (setq ispell-dictionary "en_GB"))

(use-package magit
  :ensure t
  :config
  (transient-insert-suffix 'magit-push "p"
    '("i" magit-push-implicitly))
  :bind (("C-x g" . magit-status)
         ("C-x M-g" . magit-dispatch)))

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode))
  :init
  (setq markdown-command "markdown")
  :hook ((markdwon-mode . turn-on-auto-fill)
         (markdown-mode . display-fill-column-indicator-mode)
         (gfm-mode . turn-on-auto-fill)
         (gfm-mode . display-fill-column-indicator-mode)))


(use-package grip-mode
  :ensure t
  :commands grip-mode
  :init
  (load-file "~/.emacs.d/grip-mode-sensitive.el"))

(use-package terraform-mode
  :ensure t
  :commands terraform-mode
  :config
  (setq terraform-format-on-save t)
  :hook
  (terraform-mode . superword-mode)
  (terraform-mode . turn-off-auto-fill)
  (terraform-mode . (lambda () (display-fill-column-indicator-mode -1))))

(use-package yaml-mode
  :ensure t
  :commands yaml-mode)

(use-package yaml-pro
  :ensure t
  :requires yaml
  :hook (yaml-ts-mode . yaml-pro-ts-mode))

(use-package indent-tools
  :ensure t
  :commands indent-tools-minor-mode)

(use-package git-modes
  :ensure t
  :commands (gitignore-mode gitconfig-mode))

(use-package rust-mode
  :ensure t
  :init
  (setq rust-format-on-save t)
  :commands rust-mode)

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
  (setq company-dabbrev-downcase nil
        company-dabbrev-code-everywhere t
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
                                     yaml-mode
                                     yaml-ts-mode))
  :config
  (global-company-mode 1))

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
  :hook (
         (yaml-mode . highlight-indent-guides-mode))
         (yaml-ts-mode . highlight-indent-guides-mode))

(use-package pinentry
  :ensure t
  :config
  (pinentry-start))

(use-package vterm
  :ensure t
  :config
  (setq vterm-buffer-name-string "vterm %s")
  (setq vterm-max-scrollback 10000)
  :hook (vterm-mode . (lambda () (display-line-numbers-mode -1)))
  :commands vterm)

(use-package typo
  :ensure t)

(use-package modus-themes
  :ensure t
  :config
  (load-theme 'modus-operandi-tinted 1))

(use-package plantuml-mode
  :ensure t
  :commands plantuml-mode)

(put 'narrow-to-page 'disabled nil)
(put 'set-goal-column 'disabled nil)
