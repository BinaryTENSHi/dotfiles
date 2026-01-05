;;; package --- Programming: C/C++ -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package c-mode
  :ensure nil ;; builtin
  :hook (c-ts-mode . eglot-ensure))

(use-package c++-mode
  :ensure nil ;; builtin
  :hook (c++-ts-mode . eglot-ensure))

(provide 'yuu-emacs-prog-cpp)
;;; yuu-emacs-prog-cpp.el ends here
