;;; package --- Theme configuration -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; Setup font
(let ((font (font-spec :family "JetBrains Mono" :size 12)))
  ;; normal
  (set-face-attribute 'default nil :width 'normal :weight 'normal :slant 'normal :font font))

;; Give it a cool title :smile:
(setopt frame-title-format "%b - Yuu Emacs")

;; Apply the system appearance to the titlebar
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . ns-system-appearance))

;; Make fringes thinner
;; (set-fringe-mode 8)

;; We meowing here
(use-package catppuccin-theme
  :ensure t
  :custom
  (catppuccin-enlarge-headings nil)
  :config
  (load-theme 'catppuccin :no-confirm))

(use-package doom-modeline
  :ensure t
  :init
  (doom-modeline-mode 1))

(use-package nerd-icons
  :ensure t)

(use-package dashboard
  :ensure t
  :custom
  (dashboard-startup-banner (locate-user-emacs-file "resources/banner.jpg"))
  (dashboard-banner-logo-title "HiRyS")
  (dashboard-display-icons-p t)
  (dashboard-icon-type 'nerd-icons)
  (dashboard-set-file-icons t)
  (dashboard-set-heading-icons t)
  :hook
  (elpaca-after-init . dashboard-insert-startupify-lists)
  (elpaca-after-init . dashboard-initialize)
  :config
  (dashboard-setup-startup-hook))

(use-package pulsar
  :ensure t
  :config
  (pulsar-global-mode 1))

(use-package diff-hl
  :ensure t
  :init
  (global-diff-hl-mode 1))

(provide 'yuu-emacs-theme)
;;; yuu-emacs-theme.el ends here
