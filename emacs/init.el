;; Redirect custom.el
(setq custom-file (locate-user-emacs-file "custom.el"))
(load custom-file :no-error-if-file-is-missing)

;; Setup elpaca
(load (locate-user-emacs-file "lisp/elpaca.el"))

;; Setup theme
(use-package catppuccin-theme
  :ensure t
  :config
  (load-theme 'catppuccin :no-confirm))

;; Setup nerd-icons
(use-package nerd-icons
  :ensure t)

(use-package nerd-icons-completion
  :ensure t
  :after marginalia
  :hook
  (marginalia-mode . nerd-icons-completion-marginalia-setup)
  :config
  (nerd-icons-completion-mode))

(use-package nerd-icons-corfu
  :ensure t
  :after corfu
  :config
  (add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter))

(use-package nerd-icons-dired
  :ensure t
  :hook
  (dired-mode . nerd-icons-dired-mode))

;; Setup modeline
(use-package doom-modeline
  :ensure t
  :init
  (doom-modeline-mode 1))

;; Setup evil
(use-package evil
  :ensure t
  :custom
  ;; required for evil-collection
  (evil-want-integration t)
  (evil-want-keybinding nil)

  (evil-want-C-u-scroll t)
  :config
  (evil-mode 1))

(use-package evil-collection
  :ensure t
  :after evil
  :config
  (evil-collection-init))

;; Setup VERTical Interactgive COOmpletion (vertico)
(use-package vertico
  :ensure t
  :init
  (vertico-mode 1))

;; Setup COmpletion in Region FUnction (corfu)
(use-package corfu
  :ensure t
  :bind
  ;; Use TAB for cycling
  (:map corfu-map
    ("TAB" . corfu-next)
    ([tab] . corfu-next)
    ("S-TAB" . corfu-previous)
    ([backtab] . corfu-previous))
  :custom
  (corfu-auto t)
  (corfu-cycle t)
  (corfu-preselect 'prompt)
  (corfu-auto-prefix 2)
  :init
  (global-corfu-mode 1))

;; Setup helpful
(use-package helpful
  :ensure t)

;; Setup marginalia
(use-package marginalia
  :ensure t
  :init
  (marginalia-mode 1))

;; Setup orderless
(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-defaults nil)
  (completion-category-overrides nil))

;; Setup which-key
(use-package which-key
  :ensure t
  :init
  (which-key-mode 1))

;; Setup dashboard
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

;; Setup magit
(use-package transient
  :ensure t)

(use-package magit
  :after transient
  :ensure t)
