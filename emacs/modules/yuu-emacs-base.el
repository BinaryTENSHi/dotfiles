;;; package --- Base configuration -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; Redirect custom.el
(setq custom-file (locate-user-emacs-file "custom.el"))
(load custom-file :no-error-if-file-is-missing)

;; Store backup files outside the current directory
(setq backup-directory-alist
      ;; Regex "." matches every file
      '(("." . "/tmp/emacs-backup")))

(use-package emacs
  :ensure nil ;; bultin (duh)
  :hook
  ((prog-mode text-mode) . display-line-numbers-mode)
  :init
  (savehist-mode 1)
  :custom
  (truncate-lines t)
  ;; https://www.masteringemacs.org/article/demystifying-emacs-window-manager
  ;; By default Emacs distinguishes between automatic and manual window switching.
  ;; If you effect a window switch yourself with C-x b, it’s manual — and exempt from any display action rules you create yourself.
  ;; Now Emacs treats manual buffer switching the same as programmatic switching.
  (switch-to-buffer-obey-display-actions t))

;; We do be evil :devil:
(use-package evil
  :ensure t
  :custom
  ;; Required for evil-collection
  (evil-want-integration t)
  (evil-want-keybinding nil)
  ;; C-u scroll
  (evil-want-C-u-scroll t)
  ;; Native Emacs undo/redo
  (evil-undo-system 'undo-redo)
  :config
  (evil-mode 1))

(use-package evil-collection
  :ensure t
  :after evil
  :config
  (evil-collection-init))

(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))

(use-package evil-snipe
  :ensure t
  :custom
  (evil-snipe-scope 'visible)
  :config
  (evil-snipe-mode 1)
  (evil-snipe-override-mode 1))

;; Setup consult.el - Consulting completing-read
(use-package consult
  :ensure t)

;; Setup marginalia
(use-package marginalia
  :ensure t
  :init
  ;; Marginalia must be activated in the :init section, so it gets enabled right away.
  (marginalia-mode 1))

;; Setup orderless
(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-defaults nil)
  (completion-category-overrides nil))

(defun yuu/backward-delete-word (arg)
  "Like `backward-kill-word', but doesn't affect the `kill-ring'.
With argument ARG, do this that many times."
  (interactive "p")
  (let ((kill-ring nil) (kill-ring-yank-pointer nil))
    (ignore-errors (backward-kill-word arg))))

;; Setup VERTical Interactive COmpletion (vertico)
(use-package vertico
  :ensure t
  :bind
  (:map vertico-map
	("C-j" . vertico-next)
	("C-k" . vertico-previous)
	("C-w" . yuu/backward-delete-word))
  :init
  (vertico-mode 1))

;; Setup helpful
(use-package helpful
  :ensure t)

;; Setup which-key
(use-package which-key
  :ensure t
  :init
  (which-key-mode 1))

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

;; Setup Embark
(use-package embark
  :ensure t
  :bind
  (("C-." . embark-act)))

(use-package embark-consult
  :ensure t)

(provide 'yuu-emacs-base)
;;; yuu-emacs-base.el ends here
