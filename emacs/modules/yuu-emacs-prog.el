;;; package --- Programming configuration
;;; Commentary:
;;; Code:

(use-package emacs
  :ensure nil ;; builtin
  :config
  (add-to-list 'display-buffer-alist
	       '("\\*[Cc]ompilation\\*"
		 (display-buffer-in-side-window)
		 (window-height . 0.25)
		 (side . bottom)
		 (slot . -6))))

(use-package treesit
  :ensure nil ;; builtin
  :custom
  (treesit-font-lock-level 4)
  :config
  (add-to-list 'treesit-language-source-alist '(rust "https://github.com/tree-sitter/tree-sitter-rust"))
  (add-to-list 'treesit-language-source-alist '(c "https://github.com/tree-sitter/tree-sitter-c"))
  (add-to-list 'treesit-language-source-alist '(cpp "https://github.com/tree-sitter/tree-sitter-cpp")))

(use-package flymake
  :ensure t
  :hook (emacs-lisp-mode . flymake-mode)
  :custom
  ;; Show diagnostics it in the buffer directly
  (flymake-show-diagnostics-at-end-of-line t)
  :config
  ;; Override ge and gE
  (general-define-key
   :states 'motion
    "g e" '(flymake-goto-next-error :wk "Goto next error")
    "g E" '(flymake-goto-prev-error :wk "Goto prev error")))

;; newer transient version required for magit
(use-package transient
  :ensure t)

(use-package magit
  :ensure t
  :after transient
  :config
  (yuu/leader
    "g" '(:ignore t :wk "Magit")
    "g b" '(magit-blame :wk "Magit blame")
    "g g" '(magit-status :wk "Magit status")))

;; newer package version required for eglot
(use-package jsonrpc
  :ensure t)

(use-package eglot
  :ensure t
  :after (jsonrpc flymake)
  :custom
  (eglot-inlay-hints-mode t)
  (eglot-code-action-indications '(mode-line))
  :config
  (yuu/leader
    "c a" '(eglot-code-actions :wk "Eglot code actions")
    "c f" '(eglot-format-buffer :wk "Eglot format buffer")
    "c x" '(flymake-show-buffer-diagnostics :wk "Flymake show diagnostics")
    "r r" '(eglot-rename :wk "Eglot rename")))

(use-package smartparens
  :ensure t
  :hook ((prog-mode text-mode) . smartparens-mode)
  :config
  (require 'smartparens-config))

(require 'yuu-emacs-prog-cpp)
(require 'yuu-emacs-prog-rust)

(provide 'yuu-emacs-prog)
;;; yuu-emacs-prog.el ends here
