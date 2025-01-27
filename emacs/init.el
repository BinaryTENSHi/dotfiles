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

;; Setup magit
(use-package transient
  :ensure t)

(use-package magit
  :after transient
  :ensure t)
