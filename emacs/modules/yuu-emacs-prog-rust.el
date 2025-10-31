;;; package --- Programming: Rust
;;; Commentary:
;;; Code:

(use-package rust-mode
  :ensure t
  :hook (rust-mode . eglot-ensure)
  :config
  (setq rust-format-on-save t)
  (setq rust-mode-treesitter-derive t))

(provide 'yuu-emacs-prog-rust)
;;; yuu-emacs-prog-rust.el ends here
