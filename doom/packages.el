;; -*- no-byte-compile: t; -*-
;;; ~/.doom.d/packages.el

;;; Examples:
;; (package! some-package)
;; (package! another-package :recipe (:fetcher github :repo "username/repo"))
;; (package! builtin-package :disable t)

(unpin! org)
(unpin! org-roam)
(unpin! forge)
(package! org-roam-ui)
(package! catppuccin-theme)

(package! ccls :disable t)
