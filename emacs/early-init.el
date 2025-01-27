;; Disable package.el for elpaca
(setq package-enable-at-startup nil)

;; Disable weclome screen
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)

;; Disable menu bars
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

;; Setup font
(let ((mono-spaced-font "JetBrains Mono")
      (proportionately-spaced-font "Sans"))
  (set-face-attribute 'default nil :family mono-spaced-font :height 100)
  (set-face-attribute 'fixed-pitch nil :family mono-spaced-font :height 1.0)
  (set-face-attribute 'variable-pitch nil :family proportionately-spaced-font :height 1.0))
