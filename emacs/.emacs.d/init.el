;; Load additional files
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
(load-file "~/.emacs.d/quail-diktor.el")
(load-file "~/.emacs.d/fringe-scale.el")


(set-fringe-mode 16)
(require 'fringe-scale)
(fringe-scale-setup)


(load-theme 'modus-operandi-tinted)


(eval-when-compile
  (require 'use-package))


;; Set global variables
(setq
 use-package-verbose t
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
 enable-recursive-minibuffers t
 desktop-restore-frames nil
 desktop-save 'if-exists
 ediff-split-window-function 'split-window-horizontally
 exec-path (append '("~/.cargo/bin:/opt/homebrew/bin") exec-path)
 flyspell-issue-message-flag nil
 frame-resize-pixelwise t
 minibuffer-prompt-properties '(read-only t cursor-intangible t face minibuffer-prompt)
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
 project-mode-line t
 read-buffer-completion-ignore-case t
 ;; Hide commands in M-x which do not apply to the current mode.  Corfu
 ;; commands are hidden, since they are not used via M-x. This setting is
 ;; useful beyond Corfu.
 read-extended-command-predicate #'command-completion-default-include-p
 read-file-name-completion-ignore-case t
 ring-bell-function 'ignore
 save-interprogram-paste-before-kill t
 ;; Emacs 30 and newer: Disable Ispell completion function.
 ;; Try `cape-dict' as an alternative.
 text-mode-ispell-word-completion nil
 vc-follow-symlinks nil
 what-cursor-show-names t)

(with-eval-after-load "grep"
  (add-to-list 'grep-find-ignored-directories ".terraform"))

;; Set defaults
(setq-default
 fill-column 80
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
	 "~/.cargo/bin" path-separator
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
(column-number-mode 1)
(context-menu-mode t)
(delete-selection-mode 1)
(desktop-save-mode 1)
(electric-pair-mode 1)
(global-display-line-numbers-mode 1)
(icomplete-mode 1)
(server-mode 1)
(show-paren-mode 1)
(size-indication-mode 1)

;; Set up hooks for clock persistence
(org-clock-persistence-insinuate)

;; Major-mode preferences
(add-to-list 'major-mode-remap-alist '(yaml-mode . yaml-ts-mode))

;; Add hooks
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)
(add-hook 'prog-mode-hook 'turn-on-auto-fill)
(add-hook 'prog-mode-hook 'display-fill-column-indicator-mode)
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'text-mode-hook 'visual-line-mode)
(add-hook 'xwidget-webkit-mode-hook (lambda () (display-line-numbers-mode -1)))
(add-hook 'rust-mode-hook (lambda () (setq  fill-column 100)))

;; Configure ispell
(with-eval-after-load "ispell"
  (setq ispell-program-name "/opt/homebrew/bin/hunspell")
  (setq ispell-dictionary "en_GB"))

(use-package solarized-theme
  :ensure t)

(use-package magit
  :ensure t
  :config
  (transient-insert-suffix 'magit-push "p"
    '("i" magit-push-implicitly))
  :init
  (setq magit-define-global-key-bindings 'recommended)
  :commands
  magit)

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode))
  :init
  (setq markdown-command "markdown"))

(use-package markdown-ts-mode
  :ensure t
  :commands (markdown-ts-mode)
  :init
  (add-to-list 'treesit-language-source-alist '(markdown "https://github.com/tree-sitter-grammars/tree-sitter-markdown" "v0.4.1" "tree-sitter-markdown/src"))
  (add-to-list 'treesit-language-source-alist '(markdown-inline "https://github.com/tree-sitter-grammars/tree-sitter-markdown" "v0.4.1" "tree-sitter-markdown-inline/src"))
  ;; (treesit-install-language-grammar 'markdown)
  ;; (treesit-install-language-grammar 'markdown-inline)
  (add-to-list 'major-mode-remap-alist '(markdown-mode . markdown-ts-mode)))

(use-package grip-mode
  :ensure t
  :commands grip-mode
  :init
  (load-file "~/.emacs.d/grip-mode-sensitive.el"))

(use-package terraform-mode
  :ensure t
  :config
  (setq terraform-format-on-save t)
  :hook
  (terraform-mode . superword-mode)
  (terraform-mode . turn-off-auto-fill)
  (terraform-mode . (lambda () (display-fill-column-indicator-mode -1)))
  (terraform-mode . (lambda () (setq imenu-sort-function nil)))
  :commands
  terraform-mode)

(use-package yaml-mode
  :ensure t
  :commands yaml-mode)

(use-package yaml-ts-mode
  :ensure t
  :commands yaml-ts-mode
  :init
  (add-to-list 'major-mode-remap-alist '(yaml-mode . yaml-ts-mode))
  (add-to-list 'treesit-language-source-alist '(yaml "https://github.com/tree-sitter-grammars/tree-sitter-yaml"))
  ;; (treesit-install-language-grammar 'yaml)
  )

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
  :config
  (global-flycheck-mode 1))

(use-package flycheck-rust
  :ensure t
  :requires flycheck
  :hook (rust-mode . flycheck-rust-setup))

(use-package corfu
  :ensure t
  ;; Optional customizations
  ;; :custom
  ;; (corfu-cycle t)                ;; Enable cycling for `corfu-next/previous'
  ;; (corfu-quit-at-boundary nil)   ;; Never quit at completion boundary
  ;; (corfu-quit-no-match nil)      ;; Never quit, even if there is no match
  ;; (corfu-preview-current nil)    ;; Disable current candidate preview
  ;; (corfu-preselect 'prompt)      ;; Preselect the prompt
  ;; (corfu-on-exact-match nil)     ;; Configure handling of exact matches

  ;; Enable Corfu only for certain modes. See also `global-corfu-modes'.
  ;; :hook ((prog-mode . corfu-mode)
  ;;        (shell-mode . corfu-mode)
  ;;        (eshell-mode . corfu-mode))

  :init
;; Enable auto completion and configure quitting
  (setq corfu-auto t
      corfu-quit-no-match 'separator) ;; or t

  :config
  ;; Recommended: Enable Corfu globally.  Recommended since many modes provide
  ;; Capfs and Dabbrev can be used globally (M-/).  See also the customization
  ;; variable `global-corfu-modes' to exclude certain modes.
  (global-corfu-mode)

  ;; Enable optional extension modes:
  ;; (corfu-history-mode)
  ;; (corfu-popupinfo-mode)
  )

;; Use Dabbrev with Corfu!
;; (use-package dabbrev
;;   ;; Swap M-/ and C-M-/
;;   :bind (("M-/" . dabbrev-completion)
;;          ("C-M-/" . dabbrev-expand))
;;   :config
;;   (add-to-list 'dabbrev-ignored-buffer-regexps "\\` ")
;;   ;; Available since Emacs 29 (Use `dabbrev-ignored-buffer-regexps' on older Emacs)
;;   (add-to-list 'dabbrev-ignored-buffer-modes 'authinfo-mode)
;;   (add-to-list 'dabbrev-ignored-buffer-modes 'doc-view-mode)
;;   (add-to-list 'dabbrev-ignored-buffer-modes 'pdf-view-mode)
;;   (add-to-list 'dabbrev-ignored-buffer-modes 'tags-table-mode))

(use-package cape
  :ensure t
  ;; Bind prefix keymap providing all Cape commands under a mnemonic key.
  ;; Press C-c p ? to for help.
  :bind ("C-c p" . cape-prefix-map) ;; Alternative key: M-<tab>, M-p, M-+
  ;; Alternatively bind Cape commands individually.
  ;; :bind (("C-c p d" . cape-dabbrev)
  ;;        ("C-c p h" . cape-history)
  ;;        ("C-c p f" . cape-file)
  ;;        ...)
  :hook
  ;; Add to the global default value of `completion-at-point-functions' which is
  ;; used by `completion-at-point'.  The order of the functions matters, the
  ;; first function returning a result wins.  Note that the list of buffer-local
  ;; completion functions takes precedence over the global list.
  (completion-at-point-functions . cape-dabbrev)
  (completion-at-point-functions . cape-file)
  (completion-at-point-functions . cape-elisp-block)
  ;; (completion-at-point-functions . cape-history)
  ;; ...
  )

;; (use-package vertico
;;   :ensure t
;;   :init
;;   (vertico-mode))

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

(use-package vterm
  :ensure t
  :config
  (setq vterm-buffer-name-string "vterm %s")
  (setq vterm-max-scrollback 10000)
  :hook (vterm-mode . (lambda () (display-line-numbers-mode -1)))
  :commands vterm)

(use-package typo
  :ensure t
  :commands (typo-mode typo-global-mode)
  )

(use-package plantuml-mode
  :ensure t
  :commands plantuml-mode)

(use-package treesit-fold
  :ensure t
  :init
  (setq treesit-fold-line-count-show t)  ; Show line count in folded regions
  (setq treesit-fold-line-count-format " <%d lines> ")
  :config
  (global-treesit-fold-indicators-mode 1))

;; (use-package breadcrumb
;;   :ensure t
;;   :hook (yaml-ts-mode . breadcrumb-local-mode))

(use-package lsp-mode
  :ensure t
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  (setq lsp-completion-provider :none) ;; we use Corfu!
  (setq lsp-disabled-clients '(tfls))
  (setq lsp-semantic-tokens-enable t)
  (setq lsp-semantic-tokens-honor-refresh-requests t)
  (setq lsp-enable-links t)
  (setq lsp-format-buffer-on-save t)
  (setq lsp-yaml-format-enable nil)
  (defun my/lsp-mode-setup-completion ()
  (setf (alist-get 'styles (alist-get 'lsp-capf completion-category-defaults))
          '(flex))) ;; Configure flex
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         (lsp-completion-mode . my/lsp-mode-setup-completion)
;; (terraform-mode . lsp-deferred)
	 (toml-mode . lsp-deferred)
         ;; if you want which-key integration
         (lsp-mode . lsp-enable-which-key-integration))
  :commands (lsp lsp-defrred))

(use-package lsp-ui
  :ensure t
  :commands
  lsp-ui-mode)

;; optional if you want which-key integration
(use-package which-key
    :config
    (which-key-mode))
