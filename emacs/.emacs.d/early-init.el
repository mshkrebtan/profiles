;; Defer garbage collection further back in the startup process
(setq gc-cons-threshold most-positive-fixnum)

;; GUI modes
(tool-bar-mode -1)
(scroll-bar-mode -1)


;; Frame defaults
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(add-to-list 'default-frame-alist '(font . "JetBrains Mono-14"))
(add-to-list 'default-frame-alist '(line-spacing . 0.2))


(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
