;;; package --- Yuu's Emacs configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; Always load the newer version of a file (el/elc)
(setq load-prefer-newer t)

;; Add the modules folder to the load path so we can (require) them
(add-to-list 'load-path (locate-user-emacs-file "modules"))
;; Also add it to the flymake load path
(setq elisp-flymake-byte-compile-load-path load-path)

;; Trust everything in here
;; Note: this doesn't work due to symlinks, I think?
;; (add-to-list 'trusted-content (expand-file-name (locate-user-emacs-file "./")))
;; (add-to-list 'trusted-content (concat (getenv "HOME") "/dotfiles/emacs/"))
;; (setq trusted-content :all)

;; Initialize the package manager (elpaca)
(require 'yuu-emacs-package)

;; Configure keybinds (general.el)
(require 'yuu-emacs-keybinds)

;; Configure some base settings
(require 'yuu-emacs-base)

;; Configure theme and everything graphical
(require 'yuu-emacs-theme)

;; Configure org-mode
(require 'yuu-emacs-org)

;; Configuration everything programming related
(require 'yuu-emacs-prog)

;;; init.el ends here
