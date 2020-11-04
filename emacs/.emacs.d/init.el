(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(require 'use-package)

(setq exec-path (append '("/usr/local/bin") exec-path)
      confirm-kill-emacs 'yes-or-no-p
      ring-bell-function 'ignore)

(setq-default require-final-newline t
              indent-tabs-mode nil
              js-indent-level 2
              ispell-program-name "aspell")

(server-mode 1)

(load-file "~/.emacs.d/quail-diktor.el")

(load-theme 'gruvbox-light-hard t)

(add-to-list 'default-frame-alist '(fullscreen . maximized))
(add-to-list 'default-frame-alist '(font . "JetBrains Mono-14"))
(add-to-list 'default-frame-alist '(line-spacing . 0.2))

(tool-bar-mode -1)

;; Mode Line
(size-indication-mode 1)
(column-number-mode 1)

(if (fboundp 'global-display-line-numbers-mode)
  (global-display-line-numbers-mode 1))

;; Fill column
(setq-default fill-column 80)
(global-display-fill-column-indicator-mode 1)

(delete-selection-mode 1)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

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

(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch)

(add-hook 'text-mode-hook 'visual-line-mode)
(add-hook 'text-mode-hook (lambda ()
                            (display-fill-column-indicator-mode -1)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("e1d09f1b2afc2fed6feb1d672be5ec6ae61f84e058cb757689edb669be926896" "123a8dabd1a0eff6e0c48a03dc6fb2c5e03ebc7062ba531543dfbce587e86f2a" "a06658a45f043cd95549d6845454ad1c1d6e24a99271676ae56157619952394a" "939ea070fb0141cd035608b2baabc4bd50d8ecc86af8528df9d41f4d83664c6a" "4cf9ed30ea575fb0ca3cff6ef34b1b87192965245776afa9e9e20c17d115f3fb" default))
 '(ediff-window-setup-function 'ediff-setup-windows-plain)
 '(markdown-command "/usr/local/bin/pandoc" t)
 '(package-selected-packages
   '(go-mode typo magit fill-column-indicator use-package markdown-mode evil yaml-mode terraform-mode gruvbox-theme gitignore-mode git-commit)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
