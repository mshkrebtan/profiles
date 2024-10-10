;; Tab Bar customisations
(setq tab-bar-show 1
      tab-bar-tab-hints t
      tab-bar-select-tab-modifiers '(super))

;; GUI modes
(tool-bar-mode -1)
(scroll-bar-mode -1)
(tab-bar-mode t)

(add-to-list 'initial-frame-alist '(fullscreen . maximized))
(add-to-list 'default-frame-alist '(font . "JetBrains Mono-12:antialias=none"))
(add-to-list 'default-frame-alist '(line-spacing . 0.2))

(add-to-list 'frameset-filter-alist '(ns-transparent-titlebar . :never))
(add-to-list 'frameset-filter-alist '(ns-appearance . :never))


;; Package setup
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
