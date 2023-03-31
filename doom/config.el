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

;; org-roam-ui
(use-package! websocket
    :after org-roam)

(use-package! org-roam-ui
    :after org-roam ;; or :after org
;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
;;         a hookable mode anymore, you're advised to pick something yourself
;;         if you don't care about startup time, use
;;  :hook (after-init . org-roam-ui-mode)
    :config
    (setq org-roam-ui-sync-theme t
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start t))
