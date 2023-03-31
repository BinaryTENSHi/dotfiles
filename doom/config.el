;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Font
(setq doom-font (font-spec :family "JetBrains Mono" :size 12))

;; Theme
(setq doom-theme 'doom-dracula)

;; Configure home screen
(setq fancy-splash-image (concat doom-user-dir "splash.jpg"))
(remove-hook! '+doom-dashboard-functions
  #'doom-dashboard-widget-shortmenu
  #'doom-dashboard-widget-footer)

(setq-hook! '+doom-dashboard-mode-hook
  evil-normal-state-cursor (list nil))

;; Set default work path
(setq projectile-project-search-path '("~/work"))

;; Do not create an anonymous session #n when launching emacsclient
(after! persp-mode
  (setq persp-emacsclient-init-frame-behaviour-override "main"))

(after! org
  (setq org-attach-store-link-p 'attached))
