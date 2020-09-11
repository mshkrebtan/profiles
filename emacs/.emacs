(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(require 'use-package)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ediff-window-setup-function (quote ediff-setup-windows-plain))
 '(markdown-command "/usr/local/bin/pandoc" t)
 '(package-selected-packages
   (quote
    (go-mode typo magit fill-column-indicator use-package markdown-mode evil yaml-mode terraform-mode gruvbox-theme gitignore-mode git-commit))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(server-mode 1)

;; GUI
;; ----------------------------------------------------------------------------
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(add-to-list 'default-frame-alist '(font . "JetBrains Mono-14"))
;; ----------------------------------------------------------------------------
;; end GUI

(setq-default line-spacing 0.2)
(setq-default column-number-mode t)
(setq-default fill-column 80)
(load-theme 'gruvbox-light-hard t)
(when (version<= "26.0.50" emacs-version )
  (global-display-line-numbers-mode))
(global-display-fill-column-indicator-mode)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(setq exec-path (append '("/usr/local/bin") exec-path))
(setq-default ispell-program-name "aspell")

(use-package markdown-mode
  :ensure t
  :init (setq markdown-command "/usr/local/bin/markdown")
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode))
  :hook (markdown-mode . (auto-fill-mode flyspell-mode)))

(use-package terraform-mode
  :ensure t
  :hook (terraform-mode . terraform-format-on-save-mode))

(use-package git-commit
  :ensure t)

(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch)
